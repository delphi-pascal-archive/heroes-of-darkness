(*********************** X-Heroes of Darkness *********************)
(***************************** FREEWARE ***************************)
{$R+}
unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, Grids, ComCtrls, About, Load, Des,
  Buttons, BtnMess, MMSystem, QHelp, IniFiles;

type
  TCode = (W,F,B,E,H,X,A,S,L,K,D,V,P,M,Z,FR,G,N,O,Q,Y,PT,DW,PW,T,R,CM,U,PR,FK);
  TMessages = (Pause,Loading,EndGame,Energy,NoHearts,Finished,Wait,Anomaly);
{  Константы:
W - Стена
F - Проход
B - Blip
E - Аптечка
H - Жизнь
X - Выход
A - Вода
S - Чувак
L - Скрытая стенка
K - Скрытый проход
D- Дверь
V- Ключ
Z-Враг в воде
M - лом
---
N-ОТКР ВКЛ
O-ОТКР ВЫКЛ
R-ЗАКР ВЫКЛ
T-ЗАКР ВКЛ
U-ПУЛЬТ
Q-ДВЕРЬ
---
Y-мина
PT(symbol : I) - портал
DW(symbol : J)- люк вниз
PW(symbol : C)-стена-портал
R-мина, которую можно поставить
CM(symbol : 1) -комп
PR(symbol : 2) - Бумажка с кодом
FK(symbol : 3) - факел
}

type
  TMainForm = class(TForm)
    Grid: TDrawGrid;
    MainMenu1: TMainMenu;
    Game1: TMenuItem;
    New1: TMenuItem;
    Load1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    Bevel1: TBevel;
    lbLevel: TLabel;
    lbTitle: TLabel;
    Bevel2: TBevel;
    LivesBox: TPaintBox;
    Timer1: TTimer;
    Options1: TMenuItem;
    LevelDesigner1: TMenuItem;
    Pause1: TMenuItem;
    Abort1: TMenuItem;
    Sound1: TMenuItem;
    N3: TMenuItem;
    Help1: TMenuItem;
    Messages: TPanel;
    Restart1: TMenuItem;
    N1: TMenuItem;
    QuickHelp1: TMenuItem;
    Timer2: TTimer;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Bevel8: TBevel;
    Timer3: TTimer;
    Image1: TImage;
    Label3: TLabel;
    Timer4: TTimer;
    Panel3: TPanel;
    Label7: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Label5: TLabel;
    Button13: TButton;
    Label6: TLabel;
    lbEnergy: TLabel;
    lbHearts: TLabel;
    keysnum: TLabel;
    Mess: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Panel4: TPanel;
    Label12: TLabel;
    BtnMessages: TPanel;
    lbComment: TLabel;
    BitBtn1: TBitBtn;
    procedure GridDrawCell(Sender: TObject; Col, Row: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure LivesBoxPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Load1Click(Sender: TObject);
    procedure LevelDesigner1Click(Sender: TObject);
    procedure Abort1Click(Sender: TObject);
    procedure Pause1Click(Sender: TObject);
    procedure Restart1Click(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Sound1Click(Sender: TObject);
    procedure QuickHelp1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure showkeys;
    procedure Timer2Timer(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure GridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Label8Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
  public
   function FindWay:char;
   function isOnline(dim:string):boolean;
   function FindHeroH:Char;
   function FindHeroV:Char;
   procedure AIDRAW;
   procedure FINDAI;
   procedure HUNT;
function Lot:char;
function Accept(xx,yy:integer):boolean;
function moveUP:boolean;
function moveDOWN:boolean;
function moveRight:boolean;
function moveLeft:boolean;
function moveUPRIGHT:boolean;
function moveUPLEFT:boolean;
function moveDOWNRIGHT:boolean;
function moveDOWNLEFT:boolean;

procedure UpdateElements;
    procedure AIMOVE;
    procedure Die;
    procedure LoadLevel(ALevel: Integer; AFile: String);
    procedure StopGame;
    procedure SetEnergy;
    procedure SetMessage(Mess: TMessages);
    procedure SetBtnMessage(Mess: TMessages);
    procedure SetPassMessage(ALevel: Integer; APassword: String);
    procedure StartLevel(ALevel: Integer);
    procedure HideMessage;
  end;

var
  MainForm: TMainForm;
  Map: array[0..100,0..100] of TCode;
  DatFile: Text;
  Bmp: TBitmap;
  HasKey: integer=0;
  Level, Title, Comment,
  StrSeconds, DatFileName, Pass: String;
  Bx, By, Hearts, TotalHearts, NewX, NewY,
  Lives, Seconds, CurrentLevel: Integer;
  Playing, GameEnded,AI: Boolean;
  fINI: TIniFile;
  AIX,AIY:integer; // Враг
  last:record
  dim:char;
  old:char;
  old2:char;
  len:integer;

  end;
  HasLom:Boolean;
  HasDoor : Boolean;
  HasMine : Integer;
  DOOR:TPoint;
  Portal:Boolean;
  DoorCtrl:Boolean;
  inv : boolean;
  Explose : Boolean = false;
  PWCNT:Integer;
  PWPNT1,PWPNT2:TPoint;
  killed : Boolean;
  code : integer;
implementation

{$R *.DFM}



procedure TMainForm.UpdateElements;
function GetValue(name:string):string;
begin
  Result := fIni.ReadString('Elements',name,'')
end;
begin
  if GetValue('door')=valid then
    xDes.aD.Visible:= true;
  if GetValue('key')=valid then
    xDes.aV.Visible:= true;
  if GetValue('water')=valid then
    xDes.aA.Visible:= true;
  if GetValue('anomaly')=valid then
    xDes.aG.Visible := true;
  {if GetValue('Rdoor')=valid then
    xDes.aQ.Visible := true;}
  if GetValue('Mine')=valid then
    xDes.aY.Visible:=true;
  {if GetValue('Remote')=valid then
    xDes.aU.Visible:=true;}
  if GetValue('Portal')=valid then
    xDes.aI.Visible:=true;
  if GetValue('Down')=valid then
    xDes.aJ.Visible:=true;
  if GetValue('WallPortal')=valid then
    xDes.aC.Visible:=true;
  if GetValue('Lom')=valid then
    xDes.aM.Visible:=true;
  {if GetValue('Buttons')=valid then
  begin
    xDes.aO.Visible:=true;
    xDes.aR.Visible:=true;
  end; }
end;




procedure TMainForm.SetMessage(Mess: TMessages);
begin
/// Универсальное окно сообщений
  case Mess of
  Pause: begin
    Messages.Caption := 'В ПАУЗЕ - НАЖМИТЕ НА F4';
    Messages.Font.Color := clBlue;
  end;
  Loading: begin
    Messages.Caption := 'ЖДИТЕ...';
    Messages.Font.Color := clNavy;
  end;
  EndGame: begin
    Messages.Caption := 'КОНЕЦ';
    Messages.Font.Color := clRed;
  end;
  Finished: begin
    Messages.Caption := 'ВСЕ МИССИИ ВЫПОЛЕНЫ!';
    Messages.Font.Color := clBlue;
  end;
  Wait: begin
    Messages.Caption := 'НАЖМИ F2 И ЗА ДЕЛО!';
    Messages.Font.Color := clBlue;
  end;
  Anomaly:begin
    Messages.Caption := 'НАЖМИ F2 И ЗА ДЕЛО!';
    Messages.Font.Color := clBlue;
  end;
  end;
  Messages.Show;
  Application.ProcessMessages;
end;

procedure TMainForm.SetBtnMessage(Mess: TMessages);
begin
  Timer2.Enabled := False;
  with BtnMessages do begin
    case Mess of
      NoHearts: lbComment.Caption := 'МИССИЯ НЕ ВЫПОЛНЕНА!';
      Energy: lbComment.Caption := 'ГЕРОЙ ПОГИБ!';
    end;
    lbComment.Font.Color := clNavy;
    if Sound1.Checked then
      PlaySound('Error.wav',0,snd_Async);
    ShowModal;
  end;
  Application.ProcessMessages;
end;

procedure TMainForm.SetPassMessage(ALevel: Integer; APassword: String);
begin
  label10.Caption := 'ПАРОЛЬ '+IntToStr(ALevel)+': '+APassword;
  Pass := APassword;
  Application.ProcessMessages;
end;

procedure TMainForm.StartLevel(ALevel: Integer);
begin
  if ALevel = 1 then begin
    with BtnMessages do begin
      lbComment.Caption := 'НАЧАЛО УРОВНЯ: '+IntToStr(ALevel);
      lbComment.Font.Color := clNavy;
      Show;
    end;
  end;
  Application.ProcessMessages;
  Timer1.Enabled := True;
  Timer2.Enabled := True;
end;

procedure TMainForm.HideMessage;
begin
  Messages.Hide;
  Application.ProcessMessages;
end;

procedure TMainForm.StopGame;
begin
  Playing := False;
  GameEnded := True;
  Timer1.Enabled := False;
end;

procedure TMainForm.SetEnergy;
begin
  if Seconds > 450 then Seconds := 450;
  lbEnergy.Caption := '+ '+IntToStr(Seconds);
  if Seconds <= 0 then begin
    lbEnergy.Caption := '+ 0';
    Timer1.Enabled := False;
    SetBtnMessage(Energy);
    Die;
  end;
end;

procedure TMainForm.LoadLevel(ALevel: Integer; AFile: String);
var i,j: Integer;
c: Char;

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
    'N': Result :=N;
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
  end;
end;

begin
  Playing := False;
//  SetMessage(Loading);
  if FileExists(AFile) then begin
    HasKey:=0;
    Timer1.Enabled := False;
    AssignFile(DatFile,AFile);
    Reset(DatFile);
    readln(DatFile);
    readln(DatFile);
    repeat
    Readln(DatFile,Level);
    until (Level=IntToStr(ALevel)) or (Level='');
    if Level='' then begin
      StopGame;
      CloseFile(DatFile);
      SetMessage(Finished);
    end
    else begin
    Readln(DatFile,Title);
    Readln(DatFile,StrSeconds);
    Readln(DatFile,Comment);
    lbLevel.Caption := Format('%s',[Level]);
    lbTitle.Caption := Copy(Title,1,1)
      +LowerCase(Copy(Title,2,Length(Title)-1));
    Label12.Caption := ' '+GetShortHint(Comment);
    Seconds := StrToInt(StrSeconds);
    Timer4.Enabled := GetLongHint(Comment) = 'grav';
    SetEnergy;
    TotalHearts := 0;
    HasDoor := false;
    Door:=Point(0,0);
    explose := false;
//    PlaySound('exit.wav',0,SND_ASYNC);
    Hearts := 0;
    code := Random(999);
    PWCNT:=0;
    PWPNT1:=Point(0,0);
    PWPNT2:=Point(0,0);
    killed := false;
    inv := false;
    hasmine:=0;
    for i := 0 to 33 do begin
      for j := 0 to 32 do begin
        Read(DatFile,c);
        Map[j,i] := CharToCode(c);
        if c='H' then Inc(TotalHearts);
        if c='B' then begin
          Bx := j;
          By := i;
        end;
        if c='Q' then begin DOOR:=Point(j,i); hasdoor := true; end;
        if c='C' then begin
          Inc(PWCNT);
          If PWCNT = 1 then PWPNT1 := Point(j,i)
                       else PWPNT2 := Point(j,i);
        end;
      end;
      Readln(DatFile,c);
      if c='H' then Inc(TotalHearts);
      if c='B' then begin
        Bx := j;
        By := i;
      end;
      if c='Q' then begin DOOR:=Point(j,i); hasdoor := true; end;
      if c='C' then begin
          Inc(PWCNT);
          If PWCNT = 1 then PWPNT1 := Point(j,i)
                       else PWPNT2 := Point(j,i);
        end;
      Map[j,i] := CharToCode(c);
    end;
    Grid.Repaint;
    LivesBox.Repaint;
    showkeys;
    lbHearts.Caption := 'Монеты: '+IntToStr(Hearts)+'/'+IntToStr(TotalHearts);
    CloseFile(DatFile);
    HideMessage;
    FindAI;
    Timer2.Enabled:=AI;

    Playing := True;
    GameEnded := False;
    end;
  end
  else begin
  Timer1.Enabled:=false;
  ShowMessage('Файл с картой не найден!');
  Application.Terminate;
  end;
end;

procedure TMainForm.Die;
begin
  Timer1.Enabled := False;
  if Lives > 0 then Dec(Lives);
 HasKey:=0;
showkeys;
  LivesBox.Repaint;
  if Lives = 0 then begin
    SetMessage(EndGame);
    StopGame;
  end
  else begin
  LoadLevel(CurrentLevel,DatFileName);
  if Pause1.Checked then begin
    Playing := False;
    Timer1.Enabled := False;
    SetMessage(Pause);
  end
  else StartLevel(CurrentLevel);
  end;
end;

procedure TMainForm.GridDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var Image: PChar;
begin
  Image := 'FREE';
  case Map[Col,Row] of
    W: Image := 'WALL';
    F: Image := 'FREE';
    B: Image := 'BLIP';
    E: Image := 'ENERGY';
    H: Image := 'HEART';
    X: if Hearts = TotalHearts then Image := 'EXIT' else Image := 'EXITD';
    A: Image := 'WATER';
    S: Image := 'INWATER'; // Только при положении в воде
    L: if not inv then Image := 'FREE' else Image := 'INVWALL';
    K: if not inv then Image := 'WALL' else Image := 'INVFREE';
    D: Image := 'DOOR';
    V: Image := 'KEY';
    P: if not killed then Image := 'ENEMY' else Image := 'FREE';
    Z: Image := 'ENEMYINWATER';
    M: Image := 'LOM';
    FR:Image := 'NO_ENERGY';
    G: if not inv then Image := 'FREE' else Image := 'ANOMALY';
    N: Image := 'BUTTON1';
    O: Image := 'BUTTON0';
    Q: Image := 'WALL';
    Y: Image := 'MINE';
    PT: Image := 'PORTAL1';
    DW: Image := 'DOWN';
    PW: if not inv then Image := 'WALL' else Image := 'PWALL';
    T : Image := 'ENERGY1';
    R : Image := 'MINE1';
    CM: Image := 'COMP';
    U : Image := 'PORTAL2';
    PR: Image := 'PAPER';
    FK: Image := 'FAKEL';
  end;
  Bmp.Handle := LoadBitmap(HInstance,Image);
  Grid.Canvas.Draw(Grid.CellRect(Col,Row).Left, Grid.CellRect(col,row).Top, Bmp);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  randomize;
  if FileExists('Blip.dat') then begin
    fIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'dark.ini');
    with fIni do begin
      if ReadBool('Options', 'Sound', True) = true then
      Sound1.Checked := True else Sound1.Checked := False;
    end;

  Bmp := TBitmap.Create;
  DatFileName := 'Blip.dat';
  Lives := 3;
  CurrentLevel := 1;
  LoadLevel(CurrentLevel,DatFileName);
  Playing := False;
  HasLom := false;
  GameEnded := True;
  SetMessage(Wait);
  end else
  begin
  Timer1.Enabled:=false;
  ShowMessage('Карты нет. Выходим...');
 Application.Terminate;
  end;
  MainForm.Top := 0;
  MainForm.Left := (Screen.Width div 2) - (MainForm.Width div 2);
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
Close;
end;

procedure TMainForm.LivesBoxPaint(Sender: TObject);
begin
  LivesBox.Canvas.Refresh;
  Bmp.Handle := LoadBitmap(HInstance,'BLIP');
  if Lives = 3 then
    LivesBox.Canvas.Draw(8,3,Bmp);
  if Lives > 1 then
    LivesBox.Canvas.Draw(28,3,Bmp);
  if Lives > 0 then
    LivesBox.Canvas.Draw(48,3,Bmp);
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin

  SetEnergy;
  if (GetKeyState(VK_F11)<0) and (GetKeyState(VK_SHIFT)<0) and (GetKeyState(VK_CONTROL)<0)
  then begin
    Panel3.Show;
    Edit1.Text := 'Enter code here';
    Edit1.SetFocus;
  end;
end;

procedure TMainForm.New1Click(Sender: TObject);
begin
  Lives := 3;
  CurrentLevel := 1;
  LoadLevel(CurrentLevel,DatFileName);
  if Pause1.Checked then begin
    Playing := False;
    Timer1.Enabled := False;
    Timer2.Enabled := False;
    SetMessage(Pause);
  end
  else StartLevel(CurrentLevel);
end;

procedure TMainForm.Load1Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  LoadForm.ShowModal;
end;

procedure TMainForm.LevelDesigner1Click(Sender: TObject);
begin
  if Playing then pause1click(self);
 xDes.ShowModal;   // Дизайнер
end;

procedure TMainForm.Abort1Click(Sender: TObject);
begin
  Playing := False;
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  SetMessage(EndGame);
end;

procedure TMainForm.Pause1Click(Sender: TObject);
begin
  if not GameEnded then begin
  if Pause1.Checked then begin
    Playing := True;
    Timer1.Enabled := True;
    Timer2.Enabled := True;
    HideMessage;
  end
  else begin
    Playing := False;
    Timer1.Enabled := False;
    Timer2.Enabled := False;
    SetMessage(Pause);
  end;
  Pause1.Checked := not Pause1.Checked;
  end;
end;

procedure TMainForm.Restart1Click(Sender: TObject);
begin
  Die;
end;

procedure TMainForm.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var elem:boolean;
procedure MoveBlip;
begin
  if Map[Bx,By] = S then Map[Bx,By] := A // Для работы с водой
  else Map[Bx,By] := F;
  GridDrawCell(Self,Bx,By,Rect(Bx*16,By*16,Bx*16+15,By*16+15),[]);
  Bx := NewX;       // Шаг вперед
  By := NewY;
  if Map[Bx,By] = A then Map[Bx,By] := S  // Для работы с водой
  else Map[Bx,By] := B;
  GridDrawCell(Self,Bx,By,Rect(Bx*16,By*16,Bx*16+15,By*16+15),[]);
end;
var nx,ny,mx,my,b,en,i : integer;
    sl    : TStringList;
    fn,s,s1,s2    : string;
    finded  : boolean;
begin
  if (key<41) and (key>36) and Playing then begin
    NewX := Bx;
    NewY := By;
    case key of
      38: if NewY >0 then NewY := By-1;
      40: if NewY <33 then NewY := By+1;
      37: if NewX >0 then NewX := Bx-1;
      39: if NewX <33 then NewX := Bx+1;
    end;
    if GetKeyState(VK_SPACE) < 0 then begin
      mx:=bx;
      my:=by;
    end;
    case Map[NewX,NewY] of
      PR: begin MoveBlip; ShowMessage('Код к замку : '+IntToStr(code)); end;
      CM: begin Panel2.Show;Label6.Caption:='';end;
      R: begin HasMine:=HasMine+1;PlaySound('drip.wav', 0, SND_ASYNC);MoveBlip;Label4.Caption := 'Mines: ' + IntToStr(HasMine); end;
      T: begin MoveBlip; Seconds:=Seconds+20;end;
      PW:begin
          Map[NewX,NewY]:=F;
          if (NewX=PWPNT1.X) and (NewY=PWPNT1.Y) then begin
            NewX:=PWPNT2.X;
            NewY:=PWPNT2.Y;
          end else begin
            NewX:=PWPNT1.X;
            NewY:=PWPNT1.Y;
          end;
          Grid.Repaint;
          MoveBlip;

         end;
      DW: if key = 40 then begin NewY := NewY + 1; MoveBlip; end;
      PT:begin
          s:='';
          b:=0;
          en:=0;
          i:=0;
          sl:=TStringList.Create;
          fn:=ExtractFileName(DatFileName);
          SetLength(fn, Length(fn)-3);
          fn:=fn+'bts';
          sl.LoadFromFile(fn);
          b:=sl.IndexOf(IntToStr(CurrentLevel));
          if b=-1 then begin
            MessageDlg('Ошибка карты 001',mtError,[mbOk],0);
            Application.Terminate;
          end;
          en:=sl.IndexOf(IntToStr(CurrentLevel+1));
          if en=-1 then en:=sl.Count-1;
          finded:=false;
          for i := b to en do begin
            s:=sl[i];
            SetLength(s,Length(IntToStr(NewX)+'-'+IntToStr(NewY)));
            if s = (IntToStr(NewX)+'-'+IntToStr(NewY)) then begin
              finded := true;
              s:=sl[i+1];
              s1:=Copy(s,0,Pos('-',s)-1);
              s2:=Copy(s,Pos('-',s)+1,Length(s)-Pos('-',s)+1);
              break;
            end;

          end;
          b:=0;
          en:=0;
          //[s1,b] - X, [s2,en] - Y


          if (StrToInt(s1)+1) < 29 then if Map[StrToInt(s1)+1,StrToInt(s2)] in [F,A] then begin b:= StrToInt(s1)+1; en := StrToInt(s2); end;
          if (StrToInt(s1)-1) > 0 then if Map[StrToInt(s1)-1,StrToInt(s2)] in [F,A] then begin b:= StrToInt(s1)-1; en := StrToInt(s2); end;
          if (StrToInt(s2)+1) < 19 then if Map[StrToInt(s1),StrToInt(s2)+1] in [F,A] then begin b:= StrToInt(s1); en := StrToInt(s2)+1; end;
          if (StrToInt(s2)-1) > 0 then if Map[StrToInt(s1),StrToInt(s2)-1] in [F,A] then begin b:= StrToInt(s1); en := StrToInt(s2)-1; end;

          NewX:=b;
          NewY:=en;
          MoveBlip;
        end;
      Y :begin Seconds:= Seconds - 50;MoveBlip;Mess.Caption := 'Вы подорвались на мине!';Mess.Visible := true; Timer3.Enabled:= true;if not Explose then Playsound('mine.wav', 0, SND_ASYNC);  end;
      O :begin
          s:='';
          b:=0;
          en:=0;
          i:=0;
          sl:=TStringList.Create;
          fn:=ExtractFileName(DatFileName);
          SetLength(fn, Length(fn)-3);
          fn:=fn+'bts';
          sl.LoadFromFile(fn);
          b:=sl.IndexOf(IntToStr(CurrentLevel));
          if b=-1 then begin
            MessageDlg('Ошибка карты 001',mtError,[mbOk],0);
            Application.Terminate;
          end;
          en:=sl.IndexOf(IntToStr(CurrentLevel+1));
          if en=-1 then en:=sl.Count-1;
          finded:=false;
          for i := b to en do begin
            s:=sl[i];
            SetLength(s,Length(IntToStr(NewX)+'-'+IntToStr(NewY)));
            if s = (IntToStr(NewX)+'-'+IntToStr(NewY)) then begin
              finded := true;
              s:=sl[i+1];
              Map[NewX,NewY]:=N;
              if s = 'grav' then begin
                Timer4.Enabled := not Timer4.Enabled;
                Finded := true;
                continue;

              end;
              s1:=Copy(s,0,Pos('-',s)-1);
              s2:=Copy(s,Pos('-',s)+1,Length(s)-Pos('-',s)+1);
              case Map[strtoint(s1),strtoint(s2)] of
                Q :Map[strtoint(s1),strtoint(s2)]:=F;
                F :Map[strtoint(s1),strtoint(s2)]:=Q;
                FR:Map[strtoint(s1),strtoint(s2)]:=E;
              end;

            end;
          end;
//          if s = (IntToStr(NewX)+'-'+IntToStr(NewY)) then finded := true;
          if not finded then begin
            MessageDlg('Ошибка карты 002',mtError,[mbOk],0);
            Application.Terminate;
          end;
          Grid.Repaint;
        end;
      Q :if not Explose then PlaySound('error.wav', 0, SND_ASYNC);
      N :begin
          {Map[NewX,NewY] := N;
          Map[DOOR.X, DOOR.Y] := F;
          Grid.Repaint;}
          s:='';
          b:=0;
          en:=0;
          i:=0;
          sl:=TStringList.Create;
          fn:=ExtractFileName(DatFileName);
          SetLength(fn, Length(fn)-3);
          fn:=fn+'bts';
          sl.LoadFromFile(fn);
          b:=sl.IndexOf(IntToStr(CurrentLevel));
          if b=-1 then begin
            MessageDlg('Ошибка карты 001',mtError,[mbOk],0);
            Application.Terminate;
          end;
          en:=sl.IndexOf(IntToStr(CurrentLevel+1));
          if en=-1 then en:=sl.Count-1;
          finded:=false;
          for i := b to en do begin
            s:=sl[i];
            SetLength(s,Length(IntToStr(NewX)+'-'+IntToStr(NewY)));
            if s = (IntToStr(NewX)+'-'+IntToStr(NewY)) then begin
              Map[NewX,NewY]:=O;
              finded := true;
              s:=sl[i+1];
              if s = 'grav' then begin
                Timer4.Enabled := not Timer4.Enabled;
                Finded := true;
                continue;

              end;
              s1:=Copy(s,0,Pos('-',s)-1);
              s2:=Copy(s,Pos('-',s)+1,Length(s)-Pos('-',s)+1);
              case Map[strtoint(s1),strtoint(s2)] of
                Q :Map[strtoint(s1),strtoint(s2)]:=F;
                F :Map[strtoint(s1),strtoint(s2)]:=Q;
                FR:abort;
              end;

            end;
          end;
//          if s = (IntToStr(NewX)+'-'+IntToStr(NewY)) then finded := true;
          if not finded then begin
            MessageDlg('Ошибка карты 002',mtError,[mbOk],0);
            Application.Terminate;
          end;
          Grid.Repaint;

        end;
      P : If HasLom or Killed then begin MoveBlip; AI:=false; end else die;
      Z : If HasLom or Killed then begin MoveBlip; AI:=false; end else die;
      M : begin HasLom := true; MoveBlip; end;
      G : begin Lives:= 3; LivesBoxPaint(Self);  MoveBlip; Seconds := 450; Inc(HasKey,10); Hearts := TotalHearts; lbHearts.Caption := 'Монеты: '+IntToStr(Hearts)+'/'+IntToStr(TotalHearts);MoveBlip; ShowKeys; end;
           // *** Ключ ***
      V : begin
        MoveBlip;
        Inc(HasKey);
      if (Sound1.Checked) and not Explose then PlaySound('Key.wav',0,snd_Async);
        showkeys;
        SetEnergy;
        end;
           // *** Дверь ***
      D : begin
   if HasKey>0 then MoveBlip;
      if (Sound1.Checked) and not Explose then PlaySound('Door.wav',0,snd_Async);
        SetEnergy;
      IF HasKey>0 then dec(haskey);
      ShowKeys;
        end;
      // *** Энергия ***
      E: begin
        Map[NewX,NewY] := FR;
         GridDrawCell(Self,NewX,NewY,Rect(NewX*16,NewY*16,NewX*16+15,NewY*16+15),[]);
        if Sound1.Checked and not explose then
        PlaySound('Energy.wav',0,snd_Async);
        Seconds := Seconds + 40;
        SetEnergy;

      end;
      // *** Пространство ***
      F: MoveBlip;
      // *** Вода ***
      A: begin
      MoveBlip;
      Seconds := Seconds - 1;
      SetEnergy;
      end;
      // *** Монета ***
      H: begin
        MoveBlip;
        if Sound1.Checked and not explose then
        PlaySound('Heart.wav',0,snd_Async);
        If Hearts < TotalHearts then
        Inc(Hearts);
        Grid.Repaint;
        lbHearts.Caption := 'Монеты: '+IntToStr(Hearts)+'/'+IntToStr(TotalHearts);
      end;
      // *** Скрытая стена ***
      L: begin
        if Sound1.Checked and not explose then
          PlaySound('Hidewall.wav',0,snd_Async);
        Map[NewX,NewY] := W;
        Seconds := Seconds -2;
        SetEnergy;
        GridDrawCell(Self,NewX,NewY,Rect(NewX*16,NewY*16,NewX*16+15,NewY*16+15),[]);
      end;
      // *** Скрытый проход ***
      K: begin
        if Sound1.Checked and not explose then
          PlaySound('Hidefree.wav',0,snd_Async);
        MoveBlip;
      end;
      //////
      // *** Финиш ***
      X: begin
      if Hearts=TotalHearts then begin
        MoveBlip;
        Playing := False;
        if (Sound1.Checked) and (CurrentLevel=15) then
        PlaySound('success.wav',0,snd_Async);
        elem:=false;
        Inc(CurrentLevel);
        LoadLevel(CurrentLevel,DatFileName);
        if (Level <> '') then begin
          SetPassMessage(CurrentLevel,Title);
          StartLevel(CurrentLevel);
          Timer1.Enabled := True;
          Playing := True;
        end;
     end;

      end;


    end;
    if (GetKeyState(VK_SPACE) < 0) and (HasMine>0) then begin
        Dec(HasMine);
        Map[mx,my]:=Y;
        Label4.Caption := 'Mines: ' + IntToStr(HasMine);
        Grid.repaint;
      end;
  end;
end;

procedure TMainForm.Sound1Click(Sender: TObject);
begin
  Sound1.Checked := not Sound1.Checked;
end;

procedure TMainForm.QuickHelp1Click(Sender: TObject);
begin
  QHelpForm.ShowModal;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// Сохранение настроек
fIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'dark.ini');
FIni.WriteBool('Options', 'Sound', Sound1.Checked);
Fini.WriteString('Saved','DF',datFilename);
Fini.WriteString('Saved','PS',Pass);
end;
procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
canclose:=false;
if Playing then abort1click(self);
canclose:=true;
end;

procedure TMainForm.Showkeys;
begin
keysnum.Visible:=HasKey > 0;
keysnum.Caption:=inttostr(Haskey);
end;
procedure TMainForm.FINDAI;
var tx,ty:integer;
begin
last.dim:='N';
last.len:=0;
aix:=0;
aiy:=0;
for tx:=0 to 33 do begin
for ty:=0 to 33 do
if map[tx,ty]=P
then
begin
aix:=tx;
aiy:=ty;
end;
end;
if (aix=0) and (aiy=0) then AI:=false else AI:=True;
end;
// Проверка на возможность пройти
function TMainForm.Accept(xx,yy:integer):boolean;
var r:boolean;rx,ry:integer;
begin
rx:=xx-aix; //новый х - старый
ry:=yy-aiy;
r:=true;
if ((rx<0) and (ry<0))
then
begin
if (not (map[xx+1,yy] in [F,S,A,K,V,E,H]))
and (not (map[xx,yy+1] in [F,S,A,K,V,E,H])) then r:=false;
end;
if ((rx<0) and (ry>0))
then
begin
if (not (map[xx+1,yy] in [F,S,A,K,V,E,H]))
and (not (map[xx,yy-1] in [F,S,A,K,V,E,H])) then r:=false;
end;

if ((rx>0) and (ry>0))
then
begin
if (not (map[xx-1,yy] in [F,S,A,K,V,E,H]))
and (not (map[xx,yy-1] in [F,S,A,K,V,E,H])) then r:=false;
end;
if ((rx>0) and (ry<0))
then
begin
if (not (map[xx-1,yy] in [F,S,A,K,V,E,H]))
and (not (map[xx,yy+1] in [F,S,A,K,V,E,H])) then r:=false;
end;

///
result:=r;
end;
///////////////////////////////////////////////////////////////////////////////
// Движение на одну клетку.
///////////////////////////////////////////////////////////////////////////////
function TMainForm.moveUP:boolean;
begin
result:=true;
if (aiy-1>0)
then if map[aix,aiy-1] in [F,B,S,A,Y]
then begin
if map[aix,aiy]=Z then map[aix,aiy]:=A else
map[aix,aiy]:=F;
aidraw;
dec(aiy);
hunt;
if map[aix,aiy]=A then
begin
if Sound1.Checked and not explose then
;
map[aix,aiy]:=Z
end
else
map[aix,aiy]:=P;
aidraw;
end else result:=false;
end;
function TMainForm.moveUPright:boolean;
begin
result:=true;
if (aiy-1>0) and (aix+1<33)
then if (map[aix+1,aiy-1] in [F,B,S,A,Y]) and accept(aix+1,aiy-1)
then begin
if map[aix,aiy]=Z then map[aix,aiy]:=A else
map[aix,aiy]:=F;
aidraw;
dec(aiy);
inc(aix);
hunt;
if map[aix,aiy]=A then
begin
if Sound1.Checked then
;
map[aix,aiy]:=Z
end else
map[aix,aiy]:=P;
aidraw;
end else result:=false;;
end;
function TMainForm.moveUPleft:boolean;
begin
result:=true;
if (aiy-1>0) and (aix-1>0)
then if (map[aix-1,aiy-1] in [F,B,S,A,Y]) and accept(aix-1,aiy-1)
then begin
if map[aix,aiy]=Z then map[aix,aiy]:=A else
map[aix,aiy]:=F;
aidraw;
dec(aiy);
dec(aix);
hunt;
if map[aix,aiy]=A then
begin
if Sound1.Checked then
;
map[aix,aiy]:=Z
end else
map[aix,aiy]:=P;
aidraw;
end else result:=false;;
end;
function TMainForm.MoveDown:boolean;
begin
result:=true;
if (aiy+1<33)
then if map[aix,aiy+1] in [F,B,S,A,Y]
then begin
if map[aix,aiy]=Z then map[aix,aiy]:=A else
map[aix,aiy]:=F;
aidraw;
inc(aiy);
hunt;
if map[aix,aiy]=A then
begin
if Sound1.Checked then
;
map[aix,aiy]:=Z
end else
map[aix,aiy]:=P;
aidraw;
end else result:=false;;
end;
function TMainForm.MoveDownleft:boolean;
begin
result:=true;
if (aiy+1<33) and(aix-1>0)
then if (map[aix-1,aiy+1] in [F,B,S,A,Y])and accept(aix-1,aiy-+1)
then begin
if map[aix,aiy]=Z then map[aix,aiy]:=A else
map[aix,aiy]:=F;
aidraw;
inc(aiy);
dec(aix);
hunt;
if map[aix,aiy]=A then
begin
if Sound1.Checked then
;
map[aix,aiy]:=Z
end else
map[aix,aiy]:=P;
aidraw;
end else result:=false;;
end;
function TMainForm.MoveDownRight:boolean;
begin
result:=true;
if (aiy+1<100) and(aix+1<100)
then if (map[aix+1,aiy+1] in [F,B,S,A,Y])and accept(aix+1,aiy+1)
then begin
if map[aix,aiy]=Z then map[aix,aiy]:=A else
map[aix,aiy]:=F;
aidraw;
inc(aiy);
inc(aix);
hunt;
if map[aix,aiy]=A then
begin
if Sound1.Checked then
;
map[aix,aiy]:=Z
end else
map[aix,aiy]:=P;
aidraw;
end else result:=false;;
end;
function TMainForm.MoveLeft:boolean;
begin
result:=true;
if (aix-1>0)
then if map[aix-1,aiy] in [F,B,S,A,Y]
then begin
if map[aix,aiy]=Z then map[aix,aiy]:=A else
map[aix,aiy]:=F;
aidraw;
dec(aix);
hunt;
if map[aix,aiy]=A then
begin
if Sound1.Checked then
;
map[aix,aiy]:=Z
end else
map[aix,aiy]:=P;
aidraw;
end else result:=false;;
end;
function TMainForm.MoveRight:boolean;
begin
result:=true;
if (aix+1<33)
then if map[aix+1,aiy] in [F,B,S,A,Y]
then begin
if map[aix,aiy]=Z then map[aix,aiy]:=A else
map[aix,aiy]:=F;
aidraw;
inc(aix);
hunt;
if map[aix,aiy]=A then
begin
if Sound1.Checked then
;
map[aix,aiy]:=Z
end else
map[aix,aiy]:=P;
aidraw;
end else result:=false;;
end;
///////////////////////////////////////////////////////////////////////////////
function TMainForm.FindHeroV:char;
begin
result:='N';
if by<aiy then result:='U';
if by>aiy then result:='D';
end;
function TMainForm.FindHeroH:char;
var R:Char;
begin
R:='N';
if bx<aix then r:='L';
if bx>aix then r:='R';
Result:=R;
end;
procedure TMainForm.HUNT;
begin
{if
accept(bx,by) then if
(ABS(bx-aix) in[1,0]) and (ABS(by-aiy) in [1,0])
then
begin
map[aix,aiy]:=P;
AiDraw;
if not haslom then begin
SetBtnMessage(Energy);
die;
end else AI:= false;
end;}
If Map[aix,aiy]=B then begin
  map[aix,aiy]:=P;
  AiDraw;
  if (not haslom) and (not killed) then begin
  SetBtnMessage(Energy);
  die;
  end else AI:= false;
end;
if Map[aix,aiy]=Y then begin
  AI:=false;
  Map[aix,aiy]:=F;
  killed:=true;
  PlaySound('explosion.wav',0,SND_ASYNC);
  Grid.Repaint
end;
end;


procedure TMainForm.AIDRAW;
begin
//lbtitle.Caption:=last.dim+last.old+inttostr(last.len);
if AI then
GridDrawCell(Self,AIx,AIy,Rect(AIx*16,AIy*16,AIx*16+15,AIy*16+15),[]);
end;
procedure TMainForm.AIMOVE;
var H,V,F:Char;rand:boolean;
begin
hunt;
H:=FindHeroH;
V:=FindHeroV;
rand:=not isOnline(V+H);
if rand then begin
F:=findWay;
case (F) of
'U':begin V:='U';H:='N';end;
'D':begin V:='D';H:='N';end;
'L':begin V:='N';H:='L';end;
'R':begin V:='N';H:='R';end;
//
end;
end else
begin
last.dim:='N';
last.len:=0;
end;
if (V='U') and
(H='N') then
begin
if (not moveup) then if (not moveupright) then if (not moveupleft) then if (not movedown) then if (not movedownleft) then (movedownright);
exit;
end;
if (V='D') and
(H='N') then
begin
if (not movedown) then if (not movedownright) then if (not movedownleft) then if (not moveup) then if (not moveupleft) then (moveupright);
exit
end;
if (V='N') and
(H='R') then
begin
if (not moveright) then if (not movedownright) then if (not moveupright) then if (not moveup) then if (not movedown) then if not (moveleft) then if (not movedownleft) then (moveupleft);
exit;
end;
if (V='N') and
(H='L') then
begin
if (not moveleft) then if (not movedownleft) then if (not moveupleft) then if (not moveup) then if (not movedown) then if (not moveright) then if(not movedownright) then moveupright;
exit;
end;
if (V='U') and
(H='R') then
begin
if (not moveupright) then if (not moveup) then if (not moveright) then if (not movedownleft) then if (not movedown) then if (not moveleft) then if (not moveupleft) then movedownright;
exit;
end;
if (V='U') and
(H='L') then
begin
if (not moveupleft) then if (not moveup) then if (not moveleft) then if (not movedown) then if (not movedownleft) then if not (movedownright) then moveupright;
exit;
end;
if (V='D') and
(H='R') then
begin
if (not movedownright) then if (not movedown) then if (not moveright) then if (not moveup) then if (not moveleft) then if (not movedownleft) then moveupright;
exit;
end;
if (V='D') and
(H='L') then
begin
if (not movedownleft) then if (not movedown) then if (not moveleft) then if (not moveup) then if (not moveright) then if (not movedownleft) then moveupleft;
exit;
end;
end;
procedure TMainForm.Timer2Timer(Sender: TObject);
begin
timer2.Enabled:=false;
if (Timer1.Enabled) and (playing) and (AI) then AIMOVE;
timer2.Enabled:=true;
end;

function TMainForm.isOnline(dim:string):boolean;
var x,y:integer; r:boolean;dimc:char;
begin
r:=false;
if (dim='UN') or (dim='DN') or (dim='NR') or (dim='NL')
then r:=true;
DimC:='N';
if dim='NR' then dimC:='R';
if dim='NL' then dimC:='L';
if dim='DN' then dimC:='D';
if dim='UN' then dimC:='U';
case dimC of
'L':for x:=aix downto bx do if NOT(map[x,by] in[A,F,B,S,P,Z]) then r:=false;
'R':for x:=aix to bx do if NOT(map[x,by] in[A,F,B,S,P,Z]) then r:=false;
'U':for y:=aiy downto by do if NOT(map[bx,y] in[A,F,B,S,P,Z]) then r:=false;
'D':for y:=aiy to by do if NOT(map[bx,y] in[A,F,B,S,P,Z]) then r:=false;
end;
result:=r;
end;
function TMainForm.FindWay:Char;
var x1,x2,x3,x4,y1,y2,y3,y4,len1,len2,len3,len4,ex,ey,mx,my:integer;
begin
mx:=aix;
my:=aiy;
len1:=0;
len2:=0;
len3:=0;
len4:=0;
ex:=0;
ey:=0;
if (last.len>0) then
begin
result:=last.dim;
dec(last.len,1);
end else begin
Last.len:=0;
last.old2:=last.old;
last.old:=last.dim;
Last.dim:='N';
if mx<100 then for ex:=mx+1 to 100 do   //R
begin
if (map[ex,my] in [W,E,H,X,D,V,L,K])then break else inc(len1,1);
end;
if mx>0 then for ex:=mx-1 downto 0 do  //L
begin
if (map[ex,my] in [W,E,H,X,D,V,L,K])then break else inc(len2,1);
end;
if my<100 then for ey:=my+1 to 100 do   //D
begin
if (map[mx,ey] in [W,E,H,X,D,V,L,K]) then break else inc(len3);
end;
if my>0 then for ey:=my-1 downto 0 do
begin
if (map[mx,ey] in [W,E,H,X,D,V,L,K]) then break else inc(len4);
end;
result:='N';
if (len1>0) and (last.old<>'L')then begin
last.len:=len1;
result:='R';
end;

if ((len2>len1) and (last.old<>'R'))then
begin
last.len:=len2;
result:='L';
end;
if ((len3>len2) and (last.old<>'U'))then
begin
last.len:=len3;
result:='D';
end;
if ((len4>len3) and (last.old<>'D'))then
begin
last.len:=len4;
result:='U';
end;
if Result='N' then
begin
if last.old='L' then Result:='R';
if last.old='D' then Result:='U';
if last.old='R' then Result:='L';
if last.old='U' then Result:='D';
last.len:=1;
if Result=last.old2 then Result:=Lot;
end;
dec(last.len,1);
last.dim:=Result;
/// ELSE
end;
end;
function TMainForm.Lot:char;
var s:integer;r:char;
begin
s:=Random(1001);
case s of
0..249:r:='U';
250..499:r:='L';
500..799:r:='D';
800..1000:r:='R';
end;
result:=R;
end;
procedure TMainForm.SpeedButton3Click(Sender: TObject);
begin
  Panel1.Hide;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
  Label2.Caption :='.';
  Label2.Font.Color := clRed;
  Map[DOOR.X, DOOR.Y] := Q;
  Grid.Repaint;
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
  Label2.Caption := '.';
  Label2.Font.Color:=clGreen;
  Map[DOOR.X, DOOR.Y] := F;
  Grid.Repaint;
end;

procedure TMainForm.Timer3Timer(Sender: TObject);
begin
  Mess.Visible := false;
  Timer3.Enabled := false;
end;

procedure TMainForm.Timer4Timer(Sender: TObject);
var key : Word;
begin
  key := 40;
  GridKeyDown(self, key, []);
end;

procedure TMainForm.GridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var NewX, NewY : Integer;
procedure MoveBlip;
begin
  if Map[Bx,By] = S then Map[Bx,By] := A // Для работы с водой
  else Map[Bx,By] := F;
  GridDrawCell(Self,Bx,By,Rect(Bx*16,By*16,Bx*16+15,By*16+15),[]);
  Bx := NewX;       // Шаг вперед
  By := NewY;
  if Map[Bx,By] = A then Map[Bx,By] := S  // Для работы с водой
  else Map[Bx,By] := B;
  GridDrawCell(Self,Bx,By,Rect(Bx*16,By*16,Bx*16+15,By*16+15),[]);
end;
begin


end;

procedure TMainForm.GridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if GetKeyState(VK_F7)<0 then ShowMessage(IntToStr(ACOl)+'-'+IntToStr(Arow));
end;

procedure ExecCode(Cheat : String);
var i,j : Integer;
begin
  Cheat := AnsiUpperCase(Cheat);
  if cheat='GIVEMONEY' then begin
    for i := 0 to 33 do
      for j := 0 to 33 do
        if Map[i,j] = H then Map[i,j] := F;
    MainForm.Grid.Repaint;
    Hearts := TotalHearts;
    MainForm.lbHearts.Caption := '<cheat>'
  end;
  if cheat='KILLAI' then begin
    AI:=false;
    Map[AIX,AIY]:=F;
    
  end;
  if cheat='INVISIBLE' then begin
    inv := true;
    MainForm.Grid.Refresh;
  end;
  if cheat='CODE' then ShowMessage(IntToStr(code));
  if cheat='GIVEKEY' then begin
    Inc(HasKey);
     MainForm.showkeys;
  end;
  if cheat='GIVEBOMB' then begin
    Inc(HasMine);
    MainForm.Label4.Caption := 'Mines: ' + IntToStr(HasMine);
  end;
end;

procedure TMainForm.Label8Click(Sender: TObject);
begin
  ExecCode(Edit1.Text);
  Panel3.Hide;
  Grid.Repaint;
  Grid.SetFocus;
end;

procedure TMainForm.Label9Click(Sender: TObject);
begin
  Panel3.Hide;
  Grid.SetFocus;
end;

procedure TMainForm.Button13Click(Sender: TObject);
begin
  Panel2.Hide;
  Grid.SetFocus;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  Label5.Caption := Label5.Caption + (Sender as TButton).Caption;
end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
  BtnMessages.Hide;
  Grid.SetFocus;
end;

procedure TMainForm.Button11Click(Sender: TObject);
begin
  Label5.Caption := '';
end;

procedure TMainForm.Button12Click(Sender: TObject);
var sl : TStringList;
    s,s1,s2,fn:String;
    b,en,i:Integer;
    finded : boolean;
begin
  if StrToInt(Label5.Caption) = code then begin
    s:='';
    b:=0;
    en:=0;
    i:=0;
    sl:=TStringList.Create;
          fn:=ExtractFileName(DatFileName);
          SetLength(fn, Length(fn)-3);
          fn:=fn+'bts';
          sl.LoadFromFile(fn);
          b:=sl.IndexOf(IntToStr(CurrentLevel));
          if b=-1 then begin
            MessageDlg('Ошибка карты 001',mtError,[mbOk],0);
            Application.Terminate;
          end;
          en:=sl.IndexOf(IntToStr(CurrentLevel+1));
          if en=-1 then en:=sl.Count-1;
          finded:=false;
          for i := b to en do begin
            s:=sl[i];
            SetLength(s,Length(IntToStr(NewX)+'-'+IntToStr(NewY)));
            if s = (IntToStr(NewX)+'-'+IntToStr(NewY)) then begin
              finded := true;
              s:=sl[i+1];
              s1:=Copy(s,0,Pos('-',s)-1);
              s2:=Copy(s,Pos('-',s)+1,Length(s)-Pos('-',s)+1);
              case Map[strtoint(s1),strtoint(s2)] of
                Q :Map[strtoint(s1),strtoint(s2)]:=F;
                F :Map[strtoint(s1),strtoint(s2)]:=Q;
              end;
          end;
          end;
          Grid.Repaint;
          Panel2.Hide;
          Grid.SetFocus;
  end else Label6.Caption := 'WRONG';
end;

end.
