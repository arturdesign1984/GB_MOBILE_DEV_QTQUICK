#include "logindialog.h"
#include "ui_logindialog.h"

LoginDialog::LoginDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::LoginDialog)
{
    ui->setupUi(this);

    animated = false;

    this->setWindowFlags(Qt::FramelessWindowHint | Qt::Window);
    QPalette pal(palette());
    pal.setColor(QPalette::Window, Qt::white);
    this->setAutoFillBackground(true);
    this->setPalette(pal);

    // данные для входа
    login = "login";
    password = "password";

    // привязываем закрытие окна к концу анимации прозрачности
    animationOpacity = new QPropertyAnimation(this, "opacity", this);
    connect(animationOpacity, &QAbstractAnimation::finished, this, &LoginDialog::CloseWindow);
}

LoginDialog::~LoginDialog()
{
    delete ui;
}

void LoginDialog::on_pushButton_clicked()
{
    this->close();
}

void LoginDialog::on_pushButton_2_clicked()
{
    // если анимация не создавалась, то создать
    if(!animated)
    {
        SetAnimation();
    }

    // если данные коррктны
    if(isLoginCorrect())
    {
        // стартуем анимацию прозрачности
        animationOpacity->start();

    } else
    {
        // стартуем анимацию ошибки
        animationAllGroups->start();
    }
}

void LoginDialog::SetAnimation()
{
    // Создаем группу анимации движения окна
    animationWindowGroup = new QSequentialAnimationGroup(this);

    // движение окна на лево
    QPropertyAnimation *animationToLeft = new QPropertyAnimation(this, "geometry");
    animationToLeft->setDuration(40);
    animationToLeft->setStartValue(this->geometry());
    animationToLeft->setEndValue(this->geometry().translated(-5, 0));
    // добавляем в группу
    animationWindowGroup->addAnimation(animationToLeft);

    // движение окна на право
    QPropertyAnimation *animationToRight = new QPropertyAnimation(this, "geometry");
    animationToRight->setDuration(80);
    animationToRight->setStartValue(animationToLeft->endValue());
    animationToRight->setEndValue(animationToLeft->endValue().toRect().translated(10,0));
    // добавляем в группу
    animationWindowGroup->addAnimation(animationToRight);

    // движение окна на исходную позицию
    QPropertyAnimation *animationToMidle = new QPropertyAnimation(this, "geometry");
    animationToMidle->setDuration(40);
    animationToMidle->setStartValue(animationToRight->endValue());
    animationToMidle->setEndValue(animationToRight->endValue().toRect().translated(-5, 0));
    // добавляем в группу
    animationWindowGroup->addAnimation(animationToMidle);

    // Создаем группу анимации движения окна
    animationRedFlashGroup = new QSequentialAnimationGroup(this);

    // движение окна на лево
    QPropertyAnimation *animationRedToBlack = new QPropertyAnimation(this, "color", this);
    animationRedToBlack->setDuration(1000);
    animationRedToBlack->setStartValue(QColor(Qt::red));
    animationRedToBlack->setEndValue(QColor(Qt::black));

    // добавляем в группу
    animationRedFlashGroup->addAnimation(animationRedToBlack);

    // группа параллельных анимаций
    animationAllGroups = new QParallelAnimationGroup(this);
    animationAllGroups->addAnimation(animationWindowGroup);
    animationAllGroups->addAnimation(animationRedFlashGroup);

    // анимация прозрачности
//    animationOpacity = new QPropertyAnimation(this, "opacity", this);
    animationOpacity->setDuration(1000);
    animationOpacity->setStartValue(1.0);
    animationOpacity->setEndValue(0.0);

    animated = true;
}

void LoginDialog::setColor(const QColor &newColor)
{
    QString style = QString("QLineEdit {color: rgb(%1, %2, %3); }").
                    arg(newColor.red()).
                    arg(newColor.green()).
                    arg(newColor.blue());

    ui->lineEdit_Name->setStyleSheet(style);
    ui->lineEdit_Password->setStyleSheet(style);

    m_color = newColor;
}

void LoginDialog::setOpacity(const float &newOpacity)
{
    this->setWindowOpacity(newOpacity);

    m_opacity = newOpacity;
}

bool LoginDialog::isLoginCorrect()
{
    if(ui->lineEdit_Name->text() == login && ui->lineEdit_Password->text() == password)
    {
        return true;
    }
    return false;
}

void LoginDialog::CloseWindow()
{
    this->close();
    this->setWindowOpacity(1.0); // возвращаем видимость окна
}

