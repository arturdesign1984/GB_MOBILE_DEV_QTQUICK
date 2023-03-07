#ifndef LOGINDIALOG_H
#define LOGINDIALOG_H

#include <QDialog>
#include <QPropertyAnimation>
#include <QSequentialAnimationGroup>
#include <QParallelAnimationGroup>

namespace Ui {
class LoginDialog;
}

class LoginDialog : public QDialog
{
    Q_OBJECT

    Q_PROPERTY(QColor color READ color WRITE setColor)
    Q_PROPERTY(float opacity READ opacity WRITE setOpacity)


public:
    explicit LoginDialog(QWidget *parent = nullptr);
    ~LoginDialog();

private slots:
    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

private:
    Ui::LoginDialog *ui;
    QSequentialAnimationGroup *animationWindowGroup;
    QSequentialAnimationGroup *animationRedFlashGroup;
    QParallelAnimationGroup *animationAllGroups;
    bool animated;
    void SetAnimation();

    QColor m_color;
    const QColor &color() const {return m_color;};
    void setColor(const QColor &newColor);

    float m_opacity;
    const float &opacity() const {return m_opacity;};
    void setOpacity(const float &newOpacity);
    QPropertyAnimation *animationOpacity;

    QString login, password;
    bool isLoginCorrect();
    void CloseWindow();
};

#endif // LOGINDIALOG_H
