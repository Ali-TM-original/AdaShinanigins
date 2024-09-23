with Ada.Numerics; use Ada.Numerics;
with Ada.Text_IO; use Ada.Text_IO;


package body Geometry is

   function SurfaceAreaOfSphere(R: Float) return Float is
   begin
      return 4.0 * Pi * (R ** 2);
   end SurfaceAreaOfSphere;


   function VolumeOfSphere(R: Float) return Float is
   begin

      return (4.0 / 3.0) * Pi * (R ** 3);
   end VolumeOfSphere;

   procedure AreaAndVolume(R: Float) is
   begin
      Put_Line("Volume of Sphere is: " & Float'Image(VolumeOfSphere(R)));
      Put_Line("Area of Sphere is: " & Float'Image(SurfaceAreaOfSphere(R)));
   end AreaAndVolume;

end Geometry;
