// Openapi Generator last run: : 2025-04-11T15:14:19.595136
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
    additionalProperties:
        DioProperties(pubName: 'faktura_api', pubAuthor: 'David Hinterndorfer'),
    inputSpec:
        InputSpec(path: '../backend/src/main/openapi/faktura/api_v1.yaml'),
    generatorName: Generator.dio,
    runSourceGenOnOutput: true,
    outputDirectory: 'api/faktura_api',
    forceAlwaysRun: true,
    skipIfSpecIsUnchanged: false)
class Api {}