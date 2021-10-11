{$DESCRIPTION 'Free Heroes of Darkness'}
{$R+}
{$I-}
program Blip;

uses
  Forms,
  main in 'main.pas' {MainForm},
  Load in 'Load.pas' {LoadForm},
  QHelp in 'QHelp.pas' {QHelpForm},
  Des in 'Des.pas' {xDes};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Heroes of Darkness';
  Application.MainFormOnTaskBar := true;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TQHelpForm, QHelpForm);
  Application.CreateForm(TxDes, xDes);
  Application.CreateForm(TLoadForm, LoadForm);
  Application.Run;
end.
