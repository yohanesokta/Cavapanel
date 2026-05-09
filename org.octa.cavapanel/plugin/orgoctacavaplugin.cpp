#include <QQmlExtensionPlugin>
#include <qqml.h>

#include "backend.h"

class OrgOctaCavaPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri)
    {
        qmlRegisterType<Backend>(
            uri,
            1, 0,
            "Backend"
        );
    }
};

#include "orgoctacavaplugin.moc"
