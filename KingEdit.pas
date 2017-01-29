unit KingEdit;
{
 copyright by edysoftware.com
 2014
 http://www.edysoftware.com
 dapatkan berbagai macam component, source, delphi - lazarus
 YM : edysoftware
 email: edy.sutrisno@gmail.com
}

{$MODE Delphi}



interface

uses
  SysUtils, Classes,LResources, Controls, StdCtrls, Graphics, LCLIntf, LCLType, LMessages, Messages, Forms;

type
  TKingEdit = class(TEdit)
  private

    FOldFontColor : TColor;
    FFontColorOnEnter : TColor;
    FOldBackColor : TColor;
    FColorOnEnter : TColor;

    FTabToEnter: boolean;

    property OldFontColor : TColor read FOldFontColor write FOldFontColor;
    property OldBackColor : TColor read FOldBackColor write FOldBackColor;
  protected
    procedure DoEnter; override;
    procedure DoExit; override;

    procedure KeyPress( var Key: char); override;

  public
    constructor Create(AOwner:TComponent); override;
  published
    property ColorOnEnter :TColor read FColorOnEnter write FColorOnEnter;
    property FontColorOnEnter :TColor read FFontColorOnEnter write FFontColorOnEnter;
    property TabToEnter : boolean read FTabToEnter write FTabToEnter;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('edysoftware.com', [TKingEdit]);
end;


constructor TKingEdit.Create(AOwner: TComponent);
begin
  inherited;
  FFontColorOnEnter := clred;
  FColorOnEnter := clskyblue;
  FTabToEnter:=true;
end; (*Create*)


procedure TKingEdit.DoEnter;
begin
   OldFontColor := font.Color;
  font.Color := FontColorOnEnter;
  font.Style:=[fsbold];
   OldBackColor := Color;
  Color := ColorOnEnter;

  inherited;
end;(*DoEnter*)

procedure TKingEdit.DoExit;
begin
  Color := OldBackColor;
  Font.Color:=OldFontColor;
    font.Style:=font.Style-[fsbold];

  inherited;
end; (*DoExit*)



procedure TKingEdit.KeyPress( var Key: char);
begin
  inherited KeyPress(Key);

  if TabToEnter AND (owner is TWinControl) then
  begin
   If Key = #13 Then
   begin

     (Owner as TWinControl).SelectNext(self,true,true);
    end;
   end;
end; (*KeyPress*)

initialization
  {$I kingedit.lrs}
end.
