# SDK generieren / aktualisieren

Der Code unter `lib/`, `docs/Api/`, `docs/Model/` sowie die `README.md` werden mit dem
[OpenAPI Generator](https://openapi-generator.tech) aus `.project/openapi.yaml` erzeugt und
**nicht von Hand bearbeitet**.

Voraussetzungen: Docker und `make`. Der Generator läuft im Container `openapitools/openapi-generator-cli`.

## Ablauf bei einer geänderten API

1. Neue Spezifikation nach `.project/openapi.yaml` kopieren.
2. Bei inhaltlichen Änderungen `artifactVersion` in `.project/openapi-generator.yaml` erhöhen
   (siehe [Versionierung](#versionierung)).
3. SDK neu generieren:
   ```bash
   make update-sdk
   ```
4. Änderungen prüfen:
   Umbenannte oder entfernte Klassen/Methoden sind Breaking Changes für die Nutzer des SDK.
5. Committen und taggen.

## Welche Dateien gehören wem?

| Datei / Ordner                                  | Herkunft                                                       |
|-------------------------------------------------|----------------------------------------------------------------|
| `.project/openapi.yaml`                         | API-Spezifikation, von Hand gepflegt                           |
| `.project/openapi-generator.yaml`               | Generator-Konfiguration, von Hand gepflegt                     |
| `Makefile`                                      | von Hand gepflegt                                              |
| `.openapi-generator-ignore`                     | von Hand gepflegt – Dateien, die der Generator nicht anfasst   |
| `composer.json`, `.gitignore`                   | von Hand gepflegt (stehen in der Ignore-Datei)                 |
| `docs/openapi-generator/`                       | von Hand gepflegt (diese Anleitung)                            |
| `lib/`, `docs/Api/`, `docs/Model/`, `README.md` | **generiert** – Änderungen gehen beim nächsten Lauf verloren   |
| `.openapi-generator/`, `.php-cs-fixer.dist.php` | generiert                                                      |

Soll eine weitere generierte Datei von Hand angepasst werden, muss sie in
`.openapi-generator-ignore` eingetragen werden – sonst wird sie überschrieben.

## Generator-Konfiguration

`.project/openapi-generator.yaml` legt u. a. fest:

| Option                     | Wert                                                                                       |
|----------------------------|--------------------------------------------------------------------------------------------|
| `invokerPackage`           | `In2code\In2DzgStudyDatabase` (Namespace, muss zu `autoload` in `composer.json` passen)    |
| `composerPackageName`      | `in2code/in2dzg_studydatabase_sdk` (muss zu `name` in `composer.json` passen)              |
| `artifactVersion`          | Version des SDK                                                                            |
| `variableNamingConvention` | `camelCase`                                                                                |

Da `composer.json` nicht generiert wird, müssen Namespace, Paketname und Lizenz dort bei
Änderungen von Hand nachgezogen werden.

Alle Optionen des PHP-Generators: `make generator-options`.

## Hinweis zum Host

Die Spezifikation enthält nur den relativen Server-Pfad `/api/v1`. Nutzer des SDK müssen den
Host deshalb immer setzen:

```php
$config = (new \In2code\In2DzgStudyDatabase\Configuration())->setHost('https://<domain>/api/v1');
```

## Generator-Version aktualisieren

Die Version ist im `Makefile` über `GENERATOR_VERSION` fest eingestellt (nicht `latest`), damit
zwei Läufe mit derselben Spezifikation denselben Code ergeben.

Beim Anheben der Version:

1. `GENERATOR_VERSION` im `Makefile` ändern ([Releases](https://github.com/OpenAPITools/openapi-generator/releases)).
2. `make update-sdk` ausführen und den Diff in `lib/` prüfen.
3. Abhängigkeiten abgleichen: Da `composer.json` nicht generiert wird, bekommt sie neue
   Anforderungen des Generators nicht automatisch mit. Zum Vergleich einmal ohne Ignore-Datei in
   einen temporären Ordner generieren:
   ```bash
   mkdir -p /tmp/sdk-check && cp .project/openapi.yaml /tmp/sdk-check/
   docker run --rm -u $(id -u):$(id -g) -v /tmp/sdk-check:/local \
       openapitools/openapi-generator-cli:<version> generate \
       -g php -i /local/openapi.yaml -o /local/out
   diff <(jq .require composer.json) <(jq .require /tmp/sdk-check/out/composer.json)
   ```
   Abweichungen bei `require` in die `composer.json` übernehmen.
