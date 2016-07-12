
for b in getClassInstances BitmapTexture do
(
	d = #()

	d[1] = b.bitmap.width as float
	d[2] = b.bitmap.height as float
	
	b.coords.U_Tiling = 1.0
	b.coords.V_Tiling = 1.0

	print d[1]
	print d[2]
	
	k = 1.0 / (amax d / amin d)
print k
	if(d[1] > d[2]) then b.coords.U_Tiling = k else b.coords.V_Tiling = k
)

