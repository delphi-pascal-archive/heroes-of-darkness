unit Des;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs ,
  ExtCtrls, StdCtrls, Grids, Buttons,{ NumEdit, Validations, ValCtrls,} Spin,
  Menus;

type
  TxDes = class(TForm)
    Grid: TDrawGrid;
    edComment: TEdit;
    edTitle: TEdit;
    cbLevel: TComboBox;
    SaveBtn: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Button2: TButton;
    Button3: TButton;
    Bevel3: TBevel;
    OpenDialog1: TOpenDialog;
    Messages: TPanel;
    SaveAs: TBitBtn;
    SaveDialog1: TSaveDialog;
    Bevel2: TBevel;
    edEnergy: TSpinEdit;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    aF: TMenuItem;
    aW: TMenuItem;
    aH: TMenuItem;
    aL: TMenuItem;
    aK: TMenuItem;
    aP: TMenuItem;
    aB: TMenuItem;
    aA: TMenuItem;
    aD: TMenuItem;
    aV: TMenuItem;
    aX: TMenuItem;
    aE: TMenuItem;
    aM: TMenuItem;
    aG: TMenuItem;
    Image1: TImage;
    Label1: TLabel;
    Bevel1: TBevel;
    Bevel4: TBevel;
    aY: TMenuItem;
    aU: TMenuItem;
    aI: TMenuItem;
    aJ: TMenuItem;
    aC: TMenuItem;
    aT: TMenuItem;
    aR: TMenuItem;
    a3: TMenuItem;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; Col, Row: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure GridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure GridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure cbLevelChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure edTitleChange(Sender: TObject);
    procedure edEnergyChange(Sender: TObject);
    procedure edCommentChange(Sender: TObject);
    procedure edPasswordChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edTitleEnter(Sender: TObject);
    procedure edEnergyExit(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure aFClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure OpenLevel(ALevel: Integer);
    procedure FileToArray(AFile: String);
    procedure CreateNew(AFile: String);
    procedure ShowMessage;
    procedure HideMessage;
  end;

const Valid='';
var
  xDes: TxDes;
  DFN:STRING;
implementation

{$R *.DFM}
uses Main;

type TStatus = (stFound,stNotFound,stTooMany);

var Element: TCode;
MouseDrawing, Modified, GridError: Boolean;
DMap: array[0..33,0..33] of TCode;
MapArray: array[1..15,0..33,0..33] of TCode;
LevelArray: array[1..15,1..4] of String;
MaxLev, CurrLev: Integer;
portwallcount:integer;
BlipStatus, HeartsStatus, ExitStatus, EnemyStatus, SwitchStatus, DoorStatus: TStatus;

function CharToCode(AChar: Char): TCode;
begin
  Result := F;
  case AChar of
    'W': Result := W;
    'F': Result := F;
    'B': Result := B;
    'E': Result := E;
    'H': Result := H;
    'X': Result := X;
    'A': Result := A;
    'S': Result := S;
    'L': Result := L;
    'K': Result := K;
    'D': Result :=D;
    'V': Result :=V;
    'P': Result :=P;
    'G': Result :=G;
    'M': Result :=M;
    'O': Result :=O;
    'Q': Result :=Q;
    'Y': Result :=Y;
    'I': Result := PT;
    'J': Result := DW;
    'C': Result := PW;
    'T': Result := T;
    'R': Result := R;
    '1': Result := CM;
    'U': Result := U;
    '2': Result := PR;
    '3': Result := FK;
    'N': Result := N;
  end;
end;

procedure TxDes.ShowMessage;
begin
  Messages.Caption := 'Сохраняем...';
  Messages.Show;
  Application.ProcessMessages;
end;

procedure TxDes.HideMessage;
begin
  Messages.Hide;
  Application.ProcessMessages;
end;

procedure TxDes.BitBtn2Click(Sender: TObject);
begin
  if Modified then if MessageDlg('Выйдем без сохранения?',mtConfirmation,[mbYes,mbNo],0)
    = mrNo then Exit;
  Close;
end;

procedure TxDes.FileToArray(AFile: String);
var i,j: Integer;
c: Char;



begin
    Modified := False;
    cbLevel.Clear;
    AssignFile(DatFile,AFile);
    Reset(DatFile);
    Readln(DatFile);
    Readln(DatFile);
    MaxLev := 0;
    while not eof(DatFile) do begin
    Inc(MaxLev);
    cbLevel.Items.Add(IntToStr(MaxLev));
    Readln(DatFile,LevelArray[MaxLev,1]);
    Readln(DatFile,LevelArray[MaxLev,2]);
    Readln(DatFile,LevelArray[MaxLev,3]);
    Readln(DatFile,LevelArray[MaxLev,4]);
    for i := 0 to 33 do begin
     for j := 0 to 32 do begin
       Read(DatFile,c);
       MapArray[MaxLev,j,i] := CharToCode(c);
     end;
     Readln(DatFile,c);
     MapArray[MaxLev,j,i] := CharToCode(c);
    end;
    end;
    CloseFile(DatFile);
end;

procedure TxDes.CreateNew(AFile: String);
var i: Integer;
begin
  AssignFile(DatFile,AFile);
  Rewrite(DatFile);
   WriteLn(DatFile,'Heroes of DarkNess Map File');
  WriteLn(DatFile,'Build: '+DateToStr(date)+' / '+TimeToStr(time));
  Writeln(DatFile,'1');
  Writeln(DatFile,'DARK');
  Writeln(DatFile,'200');
  Writeln(DatFile,'Пример уровня.');
  for i := 0 to 33 do
  Writeln(DatFile,StringOfChar('F',34));
  CloseFile(DatFile);
end;

procedure TxDes.OpenLevel(ALevel: Integer);
var i,j: Integer;
begin
  CurrLev := ALevel;
  cbLevel.Text := LevelArray[ALevel,1];
  edTitle.Text := Copy(LevelArray[ALevel,2],1,1)
   +LowerCase(Copy(LevelArray[ALevel,2],2,Length(LevelArray[ALevel,2])-1));
  edEnergy.Text := LevelArray[ALevel,3];
  edComment.Text := LevelArray[ALevel,4];
  for i := 0 to 33 do
   for j := 0 to 33 do
    DMap[j,i] := MapArray[ALevel,j,i];
  Grid.Repaint;
end;

procedure TxDes.FormActivate(Sender: TObject);

begin
  DFN:=DatFileName;
//  If DatFileName = 'Blip.dat' then MessageDlg('Вам не разрешено редактировать основную карту. Будет открыт пользовательский файл карты',mtError, [mbOk],0);
//  If (AnsiUpperCase(DatFileName) = 'BLIP.DAT')or(AnsiUpperCase(DatFileName)='SEKTOR A.DAT') then DFN:='USER.DAT' else DFN:=DatFileName;

  FileToArray(DFN);
  OpenLevel(1);
end;

procedure TxDes.GridDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var Image: PChar;
begin
  Image := 'FREE';
  case DMap[Col,Row] of
W: Image := 'WALL';
    F: Image := 'FREE';
    B: Image := 'BLIP';
    E: Image := 'ENERGY';
    H: Image := 'HEART';
    X: Image := 'EXIT';
    A: Image := 'WATER';
    S: Image := 'INWATER'; // Только при положении в воде
    L: Image := 'INVWALL';
    K: Image := 'INVFREE';
    D: Image := 'DOOR';
    V: Image := 'KEY';
    P: Image := 'ENEMY';
    Z: Image := 'ENEMYINWATER';
    M: Image := 'LOM';
    FR:Image := 'NO_ENERGY';
    G: Image := 'ANOMALY';
    N: Image := 'BUTTON1';
    O: Image := 'BUTTON0';
    Q: Image := 'BDOOR';
    Y: Image := 'MINE';
    PT: Image := 'PORTAL1';
    DW: Image := 'DOWN';
    PW: Image := 'PWALL';
    T : Image := 'ENERGY1';
    R : Image := 'MINE1';
    CM: Image := 'COMP';
    U : Image := 'PORTAL2';
    PR: Image := 'PAPER';
    FK: Image := 'FAKEL';
  end;
  Bmp.Handle := LoadBitmap(HInstance,Image);
 Grid.Canvas.Draw(Grid.CellRect(Col,Row).Left, Grid.CellRect(col,row).Top, Bmp)
end;

procedure TxDes.GridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Col, Row: Integer;
begin
  Modified := True;
  MouseDrawing := True;
  Grid.MouseToCell(X,Y,Col,Row);
  if Button = mbLeft then begin
    DMap[Col,Row] := Element;
    MapArray[CurrLev,Col,Row] := Element;
  end else begin
    DMap[Col,Row] := F;
    MapArray[CurrLev,Col,Row] := F;
  end;
  GridDrawCell(Self,Col,Row,Rect(Col*16,Row*16,Col*16+15,Row*16+15),[]);
end;

procedure TxDes.FormCreate(Sender: TObject);
begin
  MainForm.UpdateElements;
  Element := W;
  HideMessage;
  xDes.Caption := 'Дизайнер - '+ExtractFileName(DFN);
end;

procedure TxDes.SpeedButton1Click(Sender: TObject);
begin
  Element := W;
end;

procedure TxDes.SpeedButton2Click(Sender: TObject);
begin
  Element := F;
end;

procedure TxDes.SpeedButton3Click(Sender: TObject);
begin
  Element := H;
end;

procedure TxDes.SpeedButton4Click(Sender: TObject);
begin
  Element := B;
end;

procedure TxDes.SpeedButton5Click(Sender: TObject);
begin
  Element := E;
end;

procedure TxDes.SpeedButton6Click(Sender: TObject);
begin
  Element := X;
end;

procedure TxDes.GridMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if MouseDrawing then GridMouseDown(Self,mbLeft,[],X,Y);
end;

procedure TxDes.GridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MouseDrawing := False;
end;

procedure TxDes.Button3Click(Sender: TObject);
var i,j: Integer;
begin
  for i := 0 to 33 do
   for j := 0 to 33 do begin
    DMap[i,j] := Element;
    MapArray[CurrLev,i,j] := Element;
  end;
  Modified := True;
  Grid.Repaint;
end;

procedure TxDes.SaveBtnClick(Sender: TObject);
var i,j,qt,el: Integer;
begin
  ShowMessage;
  if (Sender as TBitBtn) = SaveAs then begin
  SaveDialog1.FileName := DFN;
  if SaveDialog1.Execute then begin
    DatFileName := SaveDialog1.Filename;
    xDes.Caption := 'Дизайнер - '+ExtractFileName(DatFileName);
  end
  else begin
    HideMessage;
    Exit;
  end;
  end;
  AssignFile(DatFile,DatFileName);
  Rewrite(DatFile);
  WriteLn(DatFile,'Heroes of DarkNess Файл карты');
  WriteLn(DatFile,'Создан: '+DateToStr(date)+' / '+TimeToStr(time));
  GridError := False;
  for qt := 1 to MaxLev do begin
    BlipStatus := stNotFound;
    EnemyStatus := stNotFound;
    HeartsStatus := stNotFound;
    ExitStatus := stNotFound;
    DoorStatus := stNotFound;
    SwitchStatus := stNotFound;
    portwallcount:=0;
    Writeln(DatFile,IntToStr(qt));
    Writeln(DatFile,UpperCase(LevelArray[qt,2]));
    Writeln(DatFile,LevelArray[qt,3]);
    Writeln(DatFile,LevelArray[qt,4]);
    for i := 0 to 33 do begin
     for j := 0 to 33 do
      case MapArray[qt,j,i] of
      W: Write(DatFile,'W');
      F: Write(DatFile,'F');
      D: Write(DatFile,'D'); // Дверь
      V: Write(DatFile,'V'); // Ключ
      P: Begin
      Write(DatFile,'P'); // Враг
      if EnemyStatus<>stNotFound then EnemyStatus := stTooMany
      else EnemyStatus := stFound;
      End;
      B: begin
      if BlipStatus<>stNotFound then BlipStatus := stTooMany
      else BlipStatus := stFound;
      Write(DatFile,'B');
      end;
      E: Write(DatFile,'E');
      H: begin
      if HeartsStatus = stNotFound then HeartsStatus := stFound;
      Write(DatFile,'H');
      end;
      X: begin
      if ExitStatus = stNotFound then ExitStatus := stFound;
      Write(DatFile,'X');
      end;
      A: Write(DatFile,'A');
      S: Write(DatFile,'S');
      L: Write(DatFile,'L');
      K: Write(DatFile,'K');
      M: Write(DatFile,'M');
      G: Write(DatFile,'G');
      Y: Write(datFile,'Y');
      O: begin
         if SwitchStatus <> stNotFound then SwitchStatus := stTooMany
                                       else SwitchStatus := stFound;

         Write(DatFile,'O');
         end;
      N: Write(datFile,'N');
      Q: begin
         if DoorStatus <> stNotFound then DoorStatus := stTooMany
                                     else DoorStatus := stFound;
         Write(datFile,'Q');
         
         end;
      PT: Write(DatFile, 'I');
      DW: Write(DatFile, 'J');
      PW: begin inc(portwallcount); Write(DatFile, 'C'); end;
      R : Write(DatFile, 'R');
      T : Write(DatFile, 'T');
      FK: Write(DatFile, '3');
      U : Write(DatFile, 'U');
      CM: Write(datFile, '1');
      PR: Write(DatFile, '2');
    end;
    Writeln(DatFile);
    end;
    if BlipStatus=stTooMany then begin
    MessageDlg('Зачем столько чуваков?',mtWarning,[mbOk],0);
    GridError := True;
    el := qt;
    end;
   if EnemyStatus=stTooMany then begin
    MessageDlg('Зачем столько врагов?',mtWarning,[mbOk],0);
    GridError := True;
    el := qt;
    end;
    if BlipStatus=stNotFound then begin
    MessageDlg('Может нужно поставить героя?',mtWarning,[mbOk],0);
    GridError := True;
    el := qt;
    end;
    if HeartsStatus=stNotFound then begin
    MessageDlg('Где жизни?',mtWarning,[mbOk],0);
    GridError := True;
    el := qt;
    end;
    if ExitStatus=stNotFound then begin
    MessageDlg('А где же выход?',mtWarning,[mbOk],0);
    GridError := True;
    el := qt;
    end;
    SwitchStatus := stFound;
    if SwitchStatus=stTooMany then begin
    MessageDlg('Много выключателей!',mtWarning,[mbOk],0);
    GridError := True;
    el := qt;
    end;
    if (portwallcount=1) or (portwallcount > 2) then begin
      MessageDlg('Неправильное число стен-порталов', mtWarning, [mbOK], 0);
      GridError := true;
      el := qt;
    end;
  end;
  CloseFile(DatFile);
  HideMessage;
  if GridError then begin
    MessageDlg('Исправь ошибку!',mtWarning,[mbOk],0);
    OpenLevel(el);
  end
  else if MessageDlg('Закрыть окно?',mtConfirmation,[mbYes,mbNo],0) = idYes then Close;
end;

procedure TxDes.SpeedButton7Click(Sender: TObject);
begin
  Element := A;
end;

procedure TxDes.cbLevelChange(Sender: TObject);
begin
  OpenLevel(StrToInt(cbLevel.Text));
end;

procedure TxDes.Button1Click(Sender: TObject);
begin
  if Modified then if MessageDlg('Не сохранились. Продолжим?',mtConfirmation,[mbYes,mbNo],0)
    = mrNo then Exit;
  OpenDialog1.FileName := DatFileName;
  if OpenDialog1.Execute then begin
      DatFileName := OpenDialog1.Filename;
      xDes.Caption := 'Дизайнер - '+ExtractFileName(DatFileName);

    if not FileExists(OpenDialog1.Filename) then begin
      CreateNew(DatFileName);
      MessageDlg('Файл создан.',mtInformation,[mbOK],0);
    end;
    FileToArray(DatFileName);
    OpenLevel(1);
  end;
end;

procedure TxDes.SpeedButton8Click(Sender: TObject);
begin
  Element := L;
end;

procedure TxDes.SpeedButton9Click(Sender: TObject);
begin
  Element := K;
end;

procedure TxDes.edTitleChange(Sender: TObject);
begin
  LevelArray[CurrLev,2] := edTitle.Text;
end;

procedure TxDes.edEnergyChange(Sender: TObject);
begin
  LevelArray[CurrLev,3] := edEnergy.Text;
end;

procedure TxDes.edCommentChange(Sender: TObject);
begin
  LevelArray[CurrLev,4] := edComment.Text;
end;

procedure TxDes.edPasswordChange(Sender: TObject);
begin
  LevelArray[CurrLev,2] := edTitle.Text;
end;

procedure TxDes.Button2Click(Sender: TObject);
var i,j: Integer;
begin
  if MaxLev < 15 then begin
  Inc(MaxLev);
  CurrLev := MaxLev;
  for i := 0 to 33 do
   for j := 0 to 33 do begin
    DMap[i,j] := F;
    MapArray[CurrLev,i,j] := F;
  end;
  LevelArray[CurrLev,1] := IntToStr(CurrLev);
  LevelArray[CurrLev,2] := 'Имя';
  LevelArray[CurrLev,3] := '100';
  LevelArray[CurrLev,4] := 'Комментарий...';
  cbLevel.Items.Add(IntToStr(CurrLev));
  cbLevel.Text := IntToStr(CurrLev);
  edTitle.Text := LevelArray[CurrLev,2];
  edEnergy.Text := LevelArray[CurrLev,3];
  edComment.Text := LevelArray[CurrLev,4];
  Grid.Repaint;
  MessageDlg('Уровень '+IntToStr(CurrLev)+' создан.',mtInformation,[mbOk],0);
  end
  else MessageDlg('Файл содержит до 15 уровней. Создайте новую карту',mtWarning,[mbOk],0);
end;

procedure TxDes.edTitleEnter(Sender: TObject);
begin
  Modified := True;
end;

procedure TxDes.edEnergyExit(Sender: TObject);
begin
  if (edEnergy.Value<20) or (edEnergy.Value>450) then begin
  MessageDlg('Энергия может быть о 20 до 450 у.е.',mtWarning,[mbOk],0);
  edEnergy.Value := 100;
  xDes.ActiveControl := edEnergy;
  end;
end;

procedure TxDes.SpeedButton10Click(Sender: TObject);
begin
Element:=D;
end;

procedure TxDes.SpeedButton11Click(Sender: TObject);
begin
Element:=V;
end;

procedure TxDes.SpeedButton12Click(Sender: TObject);
begin
Element:=P;
end;

procedure TxDes.SpeedButton13Click(Sender: TObject);
begin
Element := M;
end;

procedure TxDes.SpeedButton14Click(Sender: TObject);
begin
  Element := G;
end;

procedure TxDes.aFClick(Sender: TObject);
var ch:char;Image : String;
begin
  ch := (Sender as TMenuItem).Name[2];
  Element := CharToCode(ch);
  case Element of
    W: Image := 'WALL';
    F: Image := 'FREE';
    B: Image := 'BLIP';
    E: Image := 'ENERGY';
    H: Image := 'HEART';
    X: Image := 'EXIT';
    A: Image := 'WATER';
    S: Image := 'INWATER';
    L: Image := 'INVWALL';
    K: Image := 'INVFREE';
    D: Image := 'DOOR';
    V: Image := 'KEY';
    P: Image := 'ENEMY';
    M: Image := 'LOM';
    G: Image := 'ANOMALY';
    O: Image := 'BUTTON0';
    R: Image := 'MINE1';
    Q: Image := 'BDOOR';
    Y: Image := 'MINE';
    T: Image := 'ENERGY1';
    PT: Image := 'PORTAL';
    DW: Image := 'DOWN';
    PW: Image := 'PWALL';
    FK: Image := 'FAKEL';
  end;
  Image1.Picture.Bitmap.Handle := LoadBitmap(HInstance,PChar(Image));
end;

end.
