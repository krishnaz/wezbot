bodyLength=200;
bodyWidth=100;
bodyLowerHeight=45;
bodyUpperHeight=10;

bodyThickness = 5;
bodyLowerFrontSlopeLength=40;
bodyLowerFrontSlopeHeight=20;
bodyLowerBackSlopeLength=25;
bodyLowerBackSlopeHeight=25;

bodyUpperFrontSlopeLength=60;
bodyUpperFrontSlopeHeight=6;
bodyUpperBackSlopeLength=10;
bodyUpperBackSlopeHeight=6;
holeLocations=[
[((bodyWidth/2)-bodyThickness-6+2),-bodyLength/2+6+bodyThickness+bodyUpperBackSlopeLength,0],
[-((bodyWidth/2)-bodyThickness-6+2),-bodyLength/2+6+bodyThickness+bodyUpperBackSlopeLength,0],
[((bodyWidth/2)-bodyThickness-6+2),(bodyLength/2)-6-bodyThickness-bodyUpperFrontSlopeLength,0],
[-((bodyWidth/2)-bodyThickness-6+2),(bodyLength/2)-6-bodyThickness-bodyUpperFrontSlopeLength,0]
];
d=0.1;
$fn=30;