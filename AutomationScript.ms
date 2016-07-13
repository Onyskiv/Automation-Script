/*  
[INFO] 

NAME = Automation Script
VERSION = 1.0.1
AUTHOR = MastaMan
DEV = 
HELP = help\automationScript.html

[1.0.0]

* Initial release =

[1.0.1]

+ Added: Support for TGA format=

[ABOUT]

This script automate rendering=

[SCRIPT]
*/	

try(closeRolloutFloater fAutomationScript) catch()
global fAutomationScript = newRolloutFloater "Automation Script" 300 550

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

rollout _rStep0  "Path"
(
	group "Models"
	(
		listbox lbxModelsList "" height: 10
		button btnAddModels "Add" width: 90 across: 2
		button btnRemoveModel "Remove" width: 90
	)
	
	group "Textures Path"
	(
		edittext edtTextures "" height:25 readOnly:true 
		button btnTextures "Browse"
	)
	
	group "Replace this texture in render"
	(		
		button btnReplaceTexture "Browse" 
	)
	
	group "Save renders to"
	(
		edittext edtSaveRendersTo "" height:25 readOnly:true 
		button btnSaveRendersTo "Browse"		
	)
	
	button btnStartRender "Start Render" width: 279 height: 40 offset: [0, 10]

	global iniVault = ""
	
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
	
	fn getModels = getIniSetting iniVault "MODELS"
	fn addModels m = for i in m do setIniSetting iniVault "MODELS" i ""
		
	fn getTexturesPath = getIniSetting iniVault "TEXTURES" "TEXTURESPATH"
	fn setTexturesPath p = setIniSetting iniVault "TEXTURES" "TEXTURESPATH" p
		
	fn getReplaceTexturePath = getIniSetting iniVault "TEXTURES" "REPLACETEXTUREPATH"
	fn setReplaceTexturePath p = setIniSetting iniVault "TEXTURES" "REPLACETEXTUREPATH" p
		
	fn getSaveRendersTo = getIniSetting iniVault "RENDER" "SAVETO"
	fn setSaveRendersTo p = setIniSetting iniVault "RENDER" "SAVETO" p
	
	fn getTextures = 
	(
		t = getTexturesPath()
		
		tex = #()
		
		types = #(".jpg", ".png", ".tiff", ".gif", ".bmp", ".tga")
		for i in types do join tex (getFiles (t + @"\*" + i))
		
		return tex
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
		
		return for b in getClassInstances bitmaptexture where f != "" and findString b.filename f != undefined collect b		
	)
	
	on _rStep0 open do
	(
		iniVault = getThisScriptFilename() + ".ini"
		
		updateList()
		
		edtTextures.text = getTexturesPath()
		edtSaveRendersTo.text = getSaveRendersTo()
		
		f = filenameFromPath (getReplaceTexturePath())
		btnReplaceTexture.caption = if(f.count != 0) then f else "Browse"
	)
	
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
	
	on btnTextures pressed do
	(
		t = getTexturesPath()
		
		f = getSavePath caption: "Textures" initialDir: t
		
		if(f == undefined) do return false
				
		setTexturesPath f
		
		edtTextures.text = f
	)
	
	on btnSaveRendersTo pressed do
	(
		t = getSaveRendersTo()
		
		f = getSavePath caption: "Renders" initialDir: t
		
		if(f == undefined) do return false
				
		setSaveRendersTo f
		
		edtSaveRendersTo.text = f
	)
	
	on btnReplaceTexture pressed do
	(
		t = getReplaceTexturePath()
		
		f = getOpenFileName caption: "Select Texture" types: "JPG (*.jpg)|*.jpg|PNG (*.png)|*.png|BMP (*.bmp)|*bmp" filename: t
		
		if(f == undefined) do return false
		
		setReplaceTexturePath f
		
		btnReplaceTexture.caption = filenameFromPath f
	)
	
	on btnStartRender pressed do
	(
		_RENDER = true
		
		szModels = getModels()
		szTextures = getTexturesPath()
		szReplaceTexture = getReplaceTexturePath()
		szSaveTo = getSaveRendersTo()
		
		if(szModels.count == 0) do return messageBox "Please add models to list!" title: "Warning!"
		if(szTextures.count == 0) do return messageBox "Please select textures path!" title: "Warning!"
		if(szReplaceTexture.count == 0) do return messageBox "Please select replace textures!" title: "Warning!"
		if(szSaveTo.count == 0) do return messageBox "Please select output renders path!" title: "Warning!"
		
		vr = renderers.current
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
		vr.output_splitAlpha = false
		vr.output_genpreview = true
		
		-- Set auto quality for jpeg
		JPEG.ijpegio.setQuality 100
		
		clearListener()
				
		textureList = getTextures()
		
		for s in szModels where doesFileExist s do
		(
			loadMaxFile s useFileUnits: true quiet: true
			cams = cameras as array
			
			b = findReplaceTextures()
			
			for t in textureList do
			(				
				n = szSaveTo + @"\" + getFilenameFile s + "_" + getFilenameFile t + ".jpg"
								
				if(cams.count > 0) do viewport.setCamera cams[1]
				rendSaveFile = on
				rendOutputFileName = n	
				vr.output_splitfilename = n	
				
				-- Set textures
				for i in b do 
				(	
					i.filename = t
					setBitmapTilig i
				)
							
				max quick render
				
				if (keyboard.escPressed) do 
				(
					_RENDER = false
					return false
				)				
			)
			
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