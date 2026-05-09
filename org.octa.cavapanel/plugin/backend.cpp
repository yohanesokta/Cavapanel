#include "backend.h"

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

void Backend::start()
{
    process.start("cava");
}
