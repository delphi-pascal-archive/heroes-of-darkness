unit QHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg;

type
  TQHelpForm = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Image2: TImage;
    Panel1: TPanel;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Button3: TButton;
    Label10: TLabel;
    Button4: TButton;
    Button5: TButton;
    Timer1: TTimer;
    procedure Image2Click(Sender: TObject);
    procedure Button1MouseEnter(Sender: TObject);
    procedure Button1MouseLeave(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  two : boolean;
  QHelpForm: TQHelpForm;
  allow : Boolean = true;
implementation

{$R *.DFM}

procedure TQHelpForm.Button1MouseEnter(Sender: TObject);
begin
  Button1.Visible := false;
end;

procedure TQHelpForm.Button1MouseLeave(Sender: TObject);
begin
  Button1.Visible := true;
end;

procedure TQHelpForm.Button2Click(Sender: TObject);
begin
  Button2.Width := Button2.Width - 10;
end;

procedure TQHelpForm.Button3Click(Sender: TObject);
begin
  if not two then begin
    ShowMessage('Спасибо, ваш ответ очень важен');
    Label8.Caption := '2. Что мы сделаем с вашим ответом?';
    Button3.Caption := 'Узнать!';
    Button1.Visible := false;
    Button2.Visible := false;
    two := true;
  end else begin
    Button3.Visible := false;
    ShowMessage('Расскажем всем, что у вас комп - ДЕРЬМО!!!!!');
    Label8.Caption := 'XA-XA';
    Button5.Visible := true;
    label8.Font.Size := 20;
  end;
end;

procedure TQHelpForm.Button4Click(Sender: TObject);
begin
  Panel2.Visible := true;
  BitBtn1.Enabled := false;
  allow := false;
end;

procedure TQHelpForm.Button5Click(Sender: TObject);
begin
  Timer1.Enabled := true;
  Button5.Caption := 'Ждите';

end;

procedure TQHelpForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := false;
  if allow then CanClose := true;

end;

procedure TQHelpForm.Image2Click(Sender: TObject);
begin
  Panel1.Visible := true;
end;

procedure TQHelpForm.Timer1Timer(Sender: TObject);
begin
  Button5.Caption := Button5.Caption + '.';
  if Button5.Caption = 'Ждите.................' then begin
    allow := true;
    QHelpForm.Close;
  end;
end;

end.
