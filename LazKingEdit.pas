{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit LazKingEdit;

interface

uses
  KingEdit, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('KingEdit', @KingEdit.Register);
end;

initialization
  RegisterPackage('LazKingEdit', @Register);
end.
