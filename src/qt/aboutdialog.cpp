#include "aboutdialog.h"
#include "ui_aboutdialog.h"
#include "clientmodel.h"

#include "version.h"
#include "util.h"

AboutDialog::AboutDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::AboutDialog)
{
    ui->setupUi(this);
    if (fSanDeGo)
    {
        QPixmap aboutPixmap(":/images/about3");
        ui->label_4->setPixmap(aboutPixmap);
    }
}

void AboutDialog::setModel(ClientModel *model)
{
    if(model)
    {
        ui->versionLabel->setText(model->formatFullVersion());
    }
}

AboutDialog::~AboutDialog()
{
    delete ui;
}

void AboutDialog::on_buttonBox_accepted()
{
    close();
}
