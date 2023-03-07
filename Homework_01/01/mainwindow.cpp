#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui2 = new LoginDialog(this);
}

MainWindow::~MainWindow()
{
    delete ui;
    delete ui2;
}


void MainWindow::on_pushButton_clicked()
{
    ui2->exec();
}

