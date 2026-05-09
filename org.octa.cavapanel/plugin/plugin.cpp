#include <qqml.h>
#include "backend.h"

void registerTypes()
{
    qmlRegisterType<Backend>(
        "org.octa.cava",
        1, 0,
        "Backend"
    );
}

Q_COREAPP_STARTUP_FUNCTION(registerTypes)
