// Openapi Generator last run: : 2025-03-30T00:35:08.505554
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
    additionalProperties:
        DioProperties(pubName: 'faktura_api', pubAuthor: 'David Hinterndorfer'),
    inputSpec:
        InputSpec(path: '../backend/src/main/openapi/faktura/api_v1.yaml'),
    // typeMappings: {'Pet': 'ExamplePet'},
    generatorName: Generator.dio,
    runSourceGenOnOutput: true,
    // outputDirectory: 'api/faktura_api',
    skipIfSpecIsUnchanged: true)
class Client {}