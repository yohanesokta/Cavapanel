#include "backend.h"
#include <QTemporaryFile>
#include <QTextStream>

Backend::Backend(QObject *parent)
    : QObject(parent)
{
    connect(&process, &QProcess::readyReadStandardOutput, this, [&]() {

        QByteArray data = process.readAllStandardOutput();

        QList<QByteArray> split = data.trimmed().split(';');

        m_bars.clear();

        for (auto &v : split) {
            m_bars.append(v.toInt());
        }

        emit barsChanged();
    });
}

QVariantList Backend::bars() const
{
    return m_bars;
}

void Backend::start(int bars)
{
    QString config = QString(R"(
[output]
bars = %1
method = raw

raw_target = /dev/stdout
data_format = ascii
ascii_delim = 59
ascii_max_range = 100
framerate=60
)")
    .arg(bars);

    auto *tempFile = new QTemporaryFile(this);

    tempFile->open();

    QTextStream out(tempFile);
    out << config;
    out.flush();

    qDebug() << "CONFIG PATH:" << tempFile->fileName();

    process.start(
        "/usr/bin/cava",
        QStringList() << "-p" << tempFile->fileName()
    );
}
