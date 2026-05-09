#pragma once

#include <QObject>
#include <QProcess>
#include <QVariantList>
#include <qqmlintegration.h>

class Backend : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QVariantList bars READ bars NOTIFY barsChanged)

public:
    explicit Backend(QObject *parent = nullptr);

    QVariantList bars() const;

    Q_INVOKABLE void start();

signals:
    void barsChanged();

private:
    QProcess process;
    QVariantList m_bars;
};
