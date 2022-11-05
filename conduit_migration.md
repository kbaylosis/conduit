# Aqueduct to Conduit Migration Notes

Guide below is based on: [Migrating to null safety](https://dart.dev/null-safety/migration-guide)

## Migration Steps

1. Ensure that you are using the latest dart

2. Pinpoint libraries that need to be upgraded to its null safety versions.

```
dart pub outdated --mode=null-safety
```

3. Upgrade libraries to its null safety versions
```
dart pub upgrade --null-safety
dart pub get
dart analyze
```

4. Replace all aqueduct libraries with conduit:

| Aqueduct | Conduit |
| ----------- | ----------- |
| [aqueduct](https://pub.dev/packages/conduit)    | [conduit](https://pub.dev/packages/conduit)     |
|     | [conduit_common](https://pub.dev/packages/conduit_common)     |
| [aqueduct_test](https://pub.dev/packages/aqueduct_test)|  [conduit_test](https://pub.dev/packages/conduit_test) |
| [open_api](https://pub.dev/packages/open_api)|  [conduit_open_api (v3.dart)](https://pub.dev/packages/conduit_open_api) |

5. Known breaking changes:

| Aqueduct | Conduit |
| ----------- | ----------- |
| ```APISchemaObject.required``` | ```APISchemaObject.isRequired``` |
| <code>APIRequestBody.schema(<br>context.schema.getObjectWithType(InstanceType),<br> contentTypes: ['application/json'],<br> required: true);</code> | <code>APIRequestBody.schema(<br>context.schema.getObjectWithType(InstanceType),<br> contentTypes: ['application/json'],<br> isRequired: true);</code> |

6. Repeat steps 3-5 as needed. Adjust code manually to comply with the aqueduct and conduit differences

7. Migrate code to null-safety
```dart migrate```


