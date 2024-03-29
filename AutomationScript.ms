/*  
[INFO] 

NAME = Automation Script
VERSION = 1.0.4
AUTHOR = MastaMan
DEV = 
HELP = help\automationScript.html

[1.0.0]

* Initial release =

[1.0.1]

+ Added: Support for TGA format=

[1.0.2]

+ Added: Render from different cams=

[1.0.3]

+ Added: Button Quadrify UVW=
- BugFix: Render only one texture=
* If not found cams from list, get default cam=

[1.0.4]
- BugFix: Small fixes=
* Changed: Hardcoded resolution for out render 3000x1920=

[1.0.5]
+ Added: Replace materials functionality=
+ Added: Option render to separate folders=
+ Added: Options render size=
* Changed: Removed unused old UI elements=

[1.0.6]
+ Added: Render Region Legs=

[ABOUT]

This script automate rendering=

[SCRIPT]
*/	

try(closeRolloutFloater fAutomationScript) catch()
global fAutomationScript = newRolloutFloater "Automation Script" 300 880

fn getScriptInfo s releaseInfo: "" =
(		
	if(releaseInfo != "") do
	(
		r = getINISetting s releaseInfo
		return r
	)
	
	v = getINISetting s "INFO" "VERSION"
	a = getINISetting s "INFO" "AUTHOR"
	n = getINISetting s "INFO" "NAME"
	o = getINISetting s "ABOUT"
	c = getINISetting s "INFO" "DEV"
	h = getINISetting s "INFO" "HELP"
	
	r = for i in (getINISetting s) where i != "ABOUT" and i != "SCRIPT" and i != "COPY" collect i
	
	return #(n, a, v, o, r, c, h)
)

struct setRegionBySelectionBBox (
	fn setVrayRegion b = (	
		local vr = renderers.current

		local ws = 1
		local hs = 1
		
		local _w = renderWidth
		local _h = renderHeight
		
		if(vr.output_getsetsfrommax == false) do (
			_w = vr.output_width
			_h = vr.output_height
			ws = _w / renderWidth
			hs = _h / renderHeight
		)
		
		vrayVFBSetRegionEnabled true
		vrayVFBSetRegion (b.x*ws) (b.y*hs) ((b.x+b.w)*ws) ((b.y+b.h)*hs)
		setRenderType #view
	),

	fn getViewportSafeFrameSize = (
		vs = [gw.getWinSizeX(), gw.getWinSizeY()]
		rs = [renderWidth, renderHeight]
		
		local va = vs.x as float / vs.y
		local ra = rs.x as float / rs.y

		local x, y, w, h
		if (va > ra) then (       
			h = vs.y
			w = (h * ra) as integer
			y = 0
			x = (vs.x - w) / 2
		) else (
			w = vs.x
			h = (w / ra) as integer
			x = 0
			y = (vs.y - h) / 2        
		)
		
		return box2 x y w h
	),

	fn init paddingX: 200 paddingY: 100 = (
		nodes = for node in selection where iskindof node GeometryClass collect node
		if(nodes.count == 0) do return (print "Error: Region not set!")
		
		local bmin = [1e9,1e9,0]
		local bmax = [-1e9,-1e9,0]
		
		gw.setTransform (matrix3 1)
		tp = gw.TransPoint
		
		for n in nodes do (c
			m = snapShotAsMesh n
			for v in 1 to m.numverts do (
				vp = tp (GetVert m v)
				
				if(vp.x < bmin.x) do bmin.x = vp.x
				if(vp.x > bmax.x) do bmax.x = vp.x
				if(vp.y < bmin.y) do bmin.y = vp.y
				if(vp.y > bmax.y) do bmax.y = vp.y
			)
			
			free m
		)
		
		x = bmin.x
		y = bmin.y
		w = (bmax.x - bmin.x) as integer
		h = (bmax.y - bmin.y) as integer
		
		vpSafe = getViewportSafeFrameSize()
		
		x = x - vpSafe.x
		y = y - vpSafe.y
		
		cw = vpSafe.w
		ch = vpSafe.h
		
		px = x * 100.0 / cw
		py = y * 100.0 / ch
		pw = w * 100.0 / cw
		ph = h * 100.0 / ch
		
		x = (renderWidth * px / 100.0) as integer - paddingX
		y = (renderHeight * py / 100.0) as integer  - paddingY
		w = (renderWidth * pw  / 100.0) as integer + paddingX * 2
		h = (renderHeight * ph / 100.0) as integer + paddingY * 2
		
		setVrayRegion (box2 x y w h)
	)
)

rollout _rStep0  "Main"
(
	fn pickMaterialFilter obj = obj.material != undefined 
	
	group "Scenes"
	(
		listbox lbxModelsList "" height: 10
		button btnAddModels "Add" width: 90 across: 2
		button btnRemoveModel "Remove" width: 90
	)
	
	group "Materials" (
		label lbl1 "This material will be applied to the object with\nmaterial named \"replace-material\"" align: #left  height: 30
		listbox lbxMaterialsList height: 7
		pickbutton btnPickMaterial "Pick" width: 90 across: 2 filter: pickMaterialFilter
		button btnRemoveMaterial "Remove" width: 90
		progressbar hr "" height: 2
		label lbl2 "For this material, all textures with\nname \"replace-texture.jpg\" will be replaced\nwith textures from the folder below" align: #left  height: 40		
		edittext edtReplaceTexturePath "" readonly: true height: 22
		button btnSelectMatTexFolderPath "Select Path"
	)
	
	group "Global Settings" (
		checkbox cbxQuadrifyUVW "Quadrify UVW" align: #left
	    checkbox cbxUseSeparateFolders "Use separate folders" checked: true
		label lblRendSize "Render Size: " across: 4 align: #left
		spinner spnRendWidth range: [150, 16000, 3000] type: #integer fieldwidth: 50 align: #left
		label lblX "x" align: #left 
		spinner spnRendHeight range: [96, 16000, 1920] type: #integer fieldwidth: 50 align: #left offset: [-57, 0]
	)
	
	group "Region Render Legs" (
		label lblLayout1 "Add part of name for legs (with *)" align: #left
		label lblLayout2 "Example: Legs_*" align: #left
		label lblLayout3 "If field is empty, layout will be ignored" align: #left
		edittext edtLayout1 "" height:25 
		label lblRegionPadding "Padding: " across: 4 align: #left
		spinner spnRegionX range: [0, 16000, 1000] type: #integer fieldwidth: 50 align: #left
		label lblX2 "x" align: #left 
		spinner spnRegionY range: [0, 16000, 100] type: #integer fieldwidth: 50 align: #left offset: [-57, 0]
	)
	
	group "Cameras"
	(
		label lblCameras "Add part of camera name separated by \",\"" align: #left
		label lblCameras2 "Example: front, left, top" align: #left		
		edittext edtCameras "" height:25 
	)
	
	group "Save renders to"
	(
		edittext edtSaveRendersTo "" height:25 readOnly:true 
		button btnSaveRendersTo "Browse"		
	)
	
	button btnStartRender "Start Render" width: 279 height: 40 offset: [0, 10]

	global iniVault = ""
	global iniLogAS = ""
	
	fn getOpenModels = 
	(
		f = #()
		
		modelsDialog = dotNetObject "System.Windows.Forms.OpenFileDialog" 
		modelsDialog.title = "Select Models"
		modelsDialog.Multiselect = true
		modelsDialog.Filter = "3D Studio Max (*.max)|*.max"
		modelsDialog.FilterIndex = 1
		
		result = modelsDialog.showDialog() 
		result.ToString() 
		result.Equals result.OK 
		result.Equals result.Cancel 
		
		f = modelsDialog.fileNames 
		 
		return f
	)
	
	fn getQuadrifyUVW = getIniSetting iniVault "TEXTURES" "QUADRIFYUVW"
	fn setQuadrifyUVW p = setIniSetting iniVault "TEXTURES" "QUADRIFYUVW" (p as string)
	
	fn getModels = getIniSetting iniVault "MODELS"
	fn addModels m = for i in m do setIniSetting iniVault "MODELS" i ""
		
	fn getSaveRendersTo = getIniSetting iniVault "RENDER" "SAVETO"	
	fn setSaveRendersTo p = setIniSetting iniVault "RENDER" "SAVETO" p
		
	fn setLayout1 p = setIniSetting iniVault "LAYOUT" "1" p
	fn getSavedLayout = getIniSetting iniVault "LAYOUT" "1"
		
	fn setCameras p = setIniSetting iniVault "CAMERAS" "ENUM" p
	fn getCamerasArray = for i in (filterString (getIniSetting iniVault "CAMERAS" "ENUM") ",") collect trimRight (trimLeft i " ") " "
	fn getCameras = getIniSetting iniVault "CAMERAS" "ENUM"
	fn getCamList = (
		cams = #()
		camsArray = getCamerasArray()
		for cc in (cameras as array) where classOf cc != Targetobject do for c in camsArray where findString cc.name c == 1 do append cams cc
		
		if(cams.count == 0 and cameras.count != 0) do append cams cameras[1]
		
		return cams
	)
	
	fn getLayout1 = (
		n = getIniSetting iniVault "LAYOUT" "1"		
		return for o in geometry where (matchPattern o.name pattern: n) collect o			
	)
	
	fn getRenderSize = (
		w = getIniSetting iniVault "RENDER" "W"
		h = getIniSetting iniVault "RENDER" "H"
		
		try(if(w.count > 1) do spnRendWidth.value = w as integer) catch()
		try(if(h.count > 1) do spnRendHeight.value = h as integer) catch()
	)
	
	fn getLayoutPadding = (
		x = getIniSetting iniVault "LAYOUT" "X"
		y = getIniSetting iniVault "LAYOUT" "Y"
		
		try(if(x.count > 1) do spnRegionX.value = x as integer) catch()
		try(if(y.count > 1) do spnRegionY.value = y as integer) catch()
	)
	
	fn getMatListKey showError: false = (
		sel = lbxMaterialsList.selected
		id = lbxMaterialsList.selection
		
		if(id == 0) do (
			if(showError) do messageBox "Please select Material from list!" title: "Warning!"	
			return undefined
		)
		
		return substituteString sel "[Empty Path] " ""
	)
	
	fn getMaterialsSetup = getIniSetting iniVault "MATERIALS"
	
	fn implode a tag: ", " = (
		ret = ""
		for i in 1 to a.count do ret += a[i] + (if(i == a.count) then "" else tag)
		return ret
	)
		
	fn getMaterialsAndPaths showError: false = (
		mm = getMaterialsSetup()
		
		o = objects as array
		res = #()
		
		for i in mm do (
			for ii in o where ii.material != undefined and (matchPattern ii.material.name pattern: (i + "*")) do (
				p = getIniSetting iniVault "MATERIALS" i
				-- material, name, object, path
				appendIfUnique res #(ii.material, i, ii, p)
				exit
			)
		)
		msg = ""

		if(mm.count != res.count) do (
			foundNames = for i in res collect i[2]
			notFoundNames = for i in mm where (appendIfUnique foundNames i) collect i
			if(notFoundNames.count > 0) do (
				msg = "Next materials not found: "
				msg += implode notFoundNames
				msg += "!"
				
				return #(undefined, msg)
			)
		)
		
		notFoundPaths = for i in res where (not doesFileExist i[4]) or i[4] == "" collect i[2]
		if(notFoundPaths.count > 0) do (
			msg = "Please choose Textures path for next materials: "
			msg += implode notFoundPaths
			msg += "!"
			
			return #(undefined, msg)
		)
		
		return #(res, msg)
	)
	
	fn updateMatList = (
		mm = getMaterialsSetup()
	
		res = #()
		for i in mm do (
			v = getIniSetting iniVault "MATERIALS" i
			if(v == "" or not doesFileExist v) then (
				print v
				append res ("[Empty Path] " + i)
			) else (
				append res i
			)
		)
		
		lbxMaterialsList.items = res
		n = getMatListKey showError: false
		if(n != undefined) do (
			p = getIniSetting iniVault "MATERIALS" n
			edtReplaceTexturePath.text = p
		)
	)

	on btnPickMaterial picked obj do (
		if(obj == undefined) do return false
        
        n = obj.material.name
		
		mm = getIniSetting iniVault "MATERIALS" n
		if(mm != "") do return updateMatList()
		
		setIniSetting iniVault "MATERIALS" n ""
		
		updateMatList()
	)
	
	on btnRemoveMaterial pressed do (
		n = getMatListKey showError: true
		if(n == undefined) do return false
		
		--q = queryBox ("Do you really want to delete Material \"" + n + "\" from list?") title: "Confirm?"
		--if(not q) do return false
		
		delIniSetting iniVault "MATERIALS" n
		edtReplaceTexturePath.text = ""
		
		updateMatList()
	)
	
	on btnSelectMatTexFolderPath pressed do (
		n = getMatListKey showError: true
		if(n == undefined) do return false
		
		f = getSaveFileName filename: "DO NOT CHANGE NAME" caption:"Save File" types:"JPEG (*.jpg)|*.jpg"
        if(f == undefined) do return false

        p = getFileNamePath f
		
		setIniSetting iniVault "MATERIALS" n p
		 
		updateMatList()  
	)
	
	on lbxMaterialsList selected v do (
		updateMatList()  
	)
	
	fn getTextures p ignore: "replace-texture" = (
		tex = #()
		
		types = #(".jpg", ".png", ".tiff", ".gif", ".bmp", ".tga")
		for i in types do join tex (getFiles (p + @"\*" + i))
		
		out = for i in tex where (getFilenameFile i) != ignore collect i
			
		return out
	)
	
	fn getObjects  = (
		o = #()
		for i in (objects as array) do (
			append o i
		)
		
		return o
	)
	
	fn getBitmapsToReplace m n: "replace-texture" = (
		o = #()
		for b in getClassInstances Bitmaptexture  target:m do (
			if(b.filename == undefined) do continue
			f = getFilenameFile  b.filename			
			if(f == n) do append o b
		)
		return o
	)
	
	fn getReplaceMaterial = (	
		for i in SceneMaterials where (matchPattern i.name pattern: "replace-material*") do return i
		return undefined
	)

	fn getObjectsWithReplaceMaterial = (
		res = #()
		m = getReplaceMaterial()
		if(m == undefined) do return #()
		for ii in refs.dependents m where superClassOf ii == GeometryClass do appendIfUnique res ii		
		return res
	)
	
	fn getLowPolyPair a = (
		res = #()
		names = for i in a collect trimRight (trimRight i.name "0123456789") "_high"
			
		o = objects as array
		for i in o do (
			for ii in names where (matchPattern i.name pattern: (ii + "_low*")) do (
				append res i
				exit
			)
		)
		
		return res
	)
	
	on btnSelectMatTexFolderPath pressed do (
		n = getMatListKey showError: true
		if(n == undefined) do return false
		
		f = getSaveFileName filename: "DO NOT CHANGE NAME" caption:"Save File" types:"JPEG (*.jpg)|*.jpg"
        if(f == undefined) do return false

        p = getFileNamePath f
		
		setIniSetting iniVault "MATERIALS" n p
		 
		updateMatList()  
	)
	
	
	fn setBitmapTilig b =
	(
		d = #()

		b.coords.U_Tiling = 1.0
		b.coords.V_Tiling = 1.0

		d[1] = b.bitmap.width as float 
		d[2] = b.bitmap.height as float

		k = 1.0 / (amax d / amin d)

		if(d[1] > d[2]) then b.coords.U_Tiling = k else b.coords.V_Tiling = k
	)
	
	fn updateList =
	(
		m = getModels()
		
		lbxModelsList.items = for i in m collect getFilenameFile i
	)
	
	fn findReplaceTextures = 
	(		
		f = getReplaceTexturePath()
		f = filenameFromPath f 
		
		return for b in getClassInstances bitmaptexture where f != "" and  (filenameFromPath b.filename == f) collect b		
	)
	
	fn getSeparateFolder = (
		v = getIniSetting iniVault "RENDER" "USE_SEPARATE_FOLDERS"
        if(v == "1") then (
            cbxUseSeparateFolders.checked = true
        ) else if (v == "0") then (
			cbxUseSeparateFolders.checked = false
		)
	)
	
	on cbxUseSeparateFolders changed v do (
        setIniSetting iniVault "RENDER" "USE_SEPARATE_FOLDERS"  (if(v) then "1" else "0")
    )
	
	on spnRendWidth changed v do (
		setIniSetting iniVault "RENDER" "W"  (v as string)
	)
	
	on spnRendHeight changed v do (
		setIniSetting iniVault "RENDER" "H"  (v as string)
	)
	
	on spnRegionX changed v do (
		setIniSetting iniVault "LAYOUT" "X"  (v as string)
	)
	
	on spnRegionY changed v do (
		setIniSetting iniVault "RENDER" "Y"  (v as string)
	)
	
	on _rStep0 open do
	(
		iniVault = getThisScriptFilename() + ".ini"
		iniLogAS = edtSaveRendersTo.text + "log.ini"
		
		updateList()
		updateMatList()
		getSeparateFolder()
		getRenderSize()
		getLayoutPadding()
			
		edtSaveRendersTo.text = getSaveRendersTo()
			
		c = getCameras()
		edtCameras.text = c
			
		q = getQuadrifyUVW()
		cbxQuadrifyUVW.checked = if(q == "" or q == "false") then false else true
		
		
		edtLayout1.text = getSavedLayout()
	)
	
	on edtCameras changed v do setCameras v
	on edtLayout1 changed v do setLayout1 v
	on cbxQuadrifyUVW changed v do setQuadrifyUVW v
		
	on btnAddModels pressed do
	(
		f = getOpenModels()
				
		if(f == undefined) do return false
				
		addModels f
				
		updateList()
	)
	
	on btnRemoveModel pressed do
	(
		id = lbxModelsList.selection
		
		if(id == 0) do return false
		
		m = getModels()
		
		delIniSetting iniVault "MODELS" m[id]
				
		updateList()
	)
	
	on btnSaveRendersTo pressed do
	(
		t = getSaveRendersTo()
		
		f = getSavePath caption: "Renders" initialDir: t
		
		if(f == undefined) do return false
				
		setSaveRendersTo (f + @"\")
		
		edtSaveRendersTo.text = (f + @"\")
	)
	
	fn isVray = (
		r = renderers.current as string
		if matchpattern r pattern:"*V_Ray*" do return true
		return false
	)
	
	fn logging m nn: undefined = (
		t = (localTime as string) + " (" + (timeStamp() as string) + ")"
		print m
		f = iniLogAS
		if(nn != undefined) do (
			f = (getFileNamePath f) + nn + ".ini"
		)
		setIniSetting f "LOG" t (" > " + m)
	)
	
	on btnStartRender pressed do
	(
		_RENDER = true
		local logFileName = substituteString (substituteString (trimRight localTime " APM") "/" "-") ":" "."
		
		szModels = getModels()
		szSaveTo = getSaveRendersTo()
		
		if(szModels.count == 0) do return messageBox "Please add models to list!" title: "Warning!"
		if(szSaveTo.count == 0) do return messageBox "Please select output renders path!" title: "Warning!"
		
		local vr = renderers.current
			
		clearListener()
		
		for s in szModels where doesFileExist s do
		(
			loadMaxFile s useFileUnits: true quiet: true
			
			logging ("Info --> Open scene: " +  (filenameFromPath s)) name: logFileName
						
			if(not isVray()) do (
				logging ("Error --> Not assigned render V-Ray for scene: " +  (filenameFromPath s)) name: logFileName
				continue
			)
			
			vr = renderers.current
			setVRaySilentMode()
			fileOutGamma = 2.2
			rendSaveFile = on
			renderWidth = spnRendWidth.value
			renderHeight = spnRendHeight.value
			vfbControl #show true				
			-- Clear Previous frame
			vr.system_previousRender = 5
			-- Set Render Mask for none
			vr.imageSampler_renderMask_type = 0
			
			-- Vray Output Settings
			vr.output_on = true
			vr.output_useram = true
			vr.output_saveRawFile = false
			vr.output_splitgbuffer = true
			vr.output_splitRGB = true
			vr.output_splitAlpha = true
			vr.output_genpreview = true
			
			-- Set auto quality for jpeg
			--JPEG.ijpegio.setQuality 100
			tif.itifio.setAlpha #true
			tif.itifio.setType #color
			tif.itifio.setCompression #none
			
			cams = getCamList()
			layout1 = getLayout1()
			
			lastReplaceMaterial = undefined
			lastReplaceMaterial = getReplaceMaterial()
			if(lastReplaceMaterial == undefined) do (
				logging ("Error --> Not found \"replace-material\" in scene: " +  (filenameFromPath s)) name: logFileName
				continue
			)
			
			models = getObjectsWithReplaceMaterial()
			existModels = models
			notUsedModels = for i in getObjects() where (appendIfUnique existModels i) collect i
			
			if(models.count == 0) do (
				logging ("Error --> Models with material name \"replace-material\" not found in: " +  (filenameFromPath s)) name: logFileName
				continue
			)
			
			tmp = getMaterialsAndPaths()
			if(tmp[1] == undefined) do return (
				logging ("Error --> Scene: " +  (filenameFromPath s) + ". " + tmp[2]) name: logFileName
				continue
			)
			
			-- material, name, object, path
			matsAndPaths = tmp[1]
			
			-- material, name, object, path			
			for i in matsAndPaths do (
				targetMaterial = i[1]
				targetName = i[2]
				targetObj = i[3]
				targetPath = i[4]
							
				p = targetPath				
				textures = getTextures p
				bb = getBitmapsToReplace targetMaterial
			
				-- Directly replace material
				replaceInstances lastReplaceMaterial targetMaterial
				lastReplaceMaterial = targetMaterial
					
				if(textures.count == 0) do (
					logging ("Error --> Textures in folder not found: " +  p) name: logFileName
				)
				 
				if(bb.count == 0) do (
					logging ("Error --> Not found textures to replace for material: " +  targetName) name: logFileName
				)
				
				for t in textures do (
					for b in bb do (
						b.filename = t
						if(cbxQuadrifyUVW.checked) do setBitmapTilig b
					)
					
					maxName = getFilenameFile maxFileName
					separateFolder = ""
					if(cbxUseSeparateFolders.checked) do (
						separateFolder = maxName+ @"\"
						makeDir (edtSaveRendersTo.text + separateFolder) all: true
					)
					
					texName = getFilenameFile  t
				
					for cam in cams do (
						rendName = maxName + "-" + targetName + "-" + texName + "-" + cam.name + ".tif"							
						folderName = edtSaveRendersTo.text + separateFolder
						outFileName = folderName + rendName
						vr.output_splitfilename = outFileName
						rendOutputFileName = outFileName
						deleteFile outFileName
						vrayVFBSetRegionEnabled false
						
						if(cam != undefined) do viewport.setCamera cam
						
						if(layout1.count != 0) do (
							hide layout1
						)
						
						logging ("Render --> " + outFileName) name: logFileName
						vfbControl #show true
						max quick render
						vfbControl #show true
						print layout1
						if(layout1.count != 0) do (
							deleteFile outFileName
							
							for ll in layout1 do (
								hide layout1
								clearSelection()
								unhide ll
								select ll
								(setRegionBySelectionBBox()).init paddingX: spnRegionX.value paddingY: spnRegionY.value
									
								/*HARDCODE*/	
								/*FORCE MOVE STUDIO PLANE BY Z FOR LEG*/
								studio = $Studio
								if(studio != undefined) do (
									studio.pivot = studio.min
									studio.pos.z = selection.min.z
								)
								
								texCode = trimLeft texName (trimRight texName "0123456789")
								objCode = trimLeft ll.name (trimRight ll.name "0123456789")
									
								rendName = maxName + "-" + texCode +  "-" + objCode + "-" + cam.name + ".tif"
								outFileName = folderName + rendName
								vr.output_splitfilename = outFileName
								vr.system_previousRender = 0
								rendOutputFileName = outFileName
								deleteFile outFileName
								
								logging ("Render --> " + outFileName) name: logFileName
								
								vfbControl #show true
								max quick render
								vfbControl #show true							
							)
						)
						
						if (keyboard.escPressed) do (
							_RENDER = false
							return false
						)			
					)
					
					if(_RENDER == false) do exit
				)
			)
			
			/*local b = findReplaceTextures()
			
			for t in textureList do
			(
				for cam in cams do
				(				
					n = szSaveTo + @"\" + getFilenameFile s + "_" + getFilenameFile t + "_" + cam.name + ".tif"
					
					if(cam != undefined) do viewport.setCamera cam
					deleteFile n
					rendSaveFile = on
					rendOutputFileName = n
					renderWidth = 3000
					renderHeight = 1920
					vfbControl #show true
					
					-- Clear Previous frame
					vr.system_previousRender = 5
					-- Set Render Mask for none
					vr.imageSampler_renderMask_type = 0
					
					-- Vray Output Settings
					vr.output_on = true
					vr.output_useram = true
					vr.output_saveRawFile = false
					vr.output_splitgbuffer = true
					vr.output_splitRGB = true
					vr.output_splitAlpha = true
					vr.output_genpreview = true
					
					-- Set auto quality for jpeg
					--JPEG.ijpegio.setQuality 100
					tif.itifio.setAlpha #true
					tif.itifio.setType #color
					tif.itifio.setCompression #none
					vr.output_splitfilename = n	
					
					-- Set textures
					for j in b do (	
						j.filename = t
						if(cbxQuadrifyUVW.checked) do setBitmapTilig j
					)
					
					max quick render
					vfbControl #show true
					
					if (keyboard.escPressed) do (
						_RENDER = false
						return false
					)			
				
				
				if(_RENDER == false) do exit
			)*/
			
			if(_RENDER == false) do exit
		)	
	)
)	

rollout _rAbout "About" 
(
	label lblName "" 
	label lblVer "" 
	
	label lblAuthor "" height: 30
	label lblCopy ""  height: 30
	button btnHelp "Help" enabled: false
	
	fn getHelp run: false =
	(
		s = getThisScriptFilename()
		i = getScriptInfo s
		szHelp = (getFilenamePath s) + i[7]
		if(doesFileExist szHelp) do btnHelp.enabled = true
			
		if(run) do ShellLaunch szHelp ""
	)
	
	on btnHelp pressed do getHelp run: true
		
	on _rAbout open do
	(		
		i = getScriptInfo (getThisScriptFilename())
			
		lblName.caption = i[1]
		lblAuthor.caption = i[2]
		lblVer.caption = i[3]
		lblCopy.caption = i[6]
		
		getHelp()
	)
)

addRollout _rStep0 fAutomationScript rolledUp:false
addRollout _rAbout fAutomationScript rolledUp:true 