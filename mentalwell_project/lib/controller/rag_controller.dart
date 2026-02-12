// import 'package:ai_edge_rag/ai_edge_rag.dart';

// // Get the AI Edge RAG instance
// var aiEdgeRag = AiEdgeRag.instance;

// // Step 1: Initialize the language model

// void initalizeModel() async {
//   await aiEdgeRag.initialize(
//     modelPath: '/path/to/your/model.task',
//     maxTokens: 512,
//     temperature: 0.7,
//   );
// }

// // Step 2: Create an embedding model for RAG
// void embeddingModel() async {
//   await aiEdgeRag.createEmbeddingModel(
//     tokenizerModelPath: '/path/to/tokenizer.model',
//     embeddingModelPath: '/path/to/embedding.bin',
//     modelType: EmbeddingModelType.gemma, // Optional, defaults to gemma
//     vectorStore: VectorStore.sqlite, // Optional, defaults to inMemory
//   );
// }

// // Step 3: Set system instruction for RAG behavior
// void setInstructions() async {
//   await aiEdgeRag.setSystemInstruction(
//     SystemInstruction(
//       instruction:
//           'Use the provided context to answer questions accurately. '
//           'If the answer is not in the context, say so explicitly.',
//     ),
//   );
// }

// // Step 4: Add your documents to the vector store
// void addDocs() async {
//   await aiEdgeRag.memorizeChunkedText(
//     '''Flutter is Google's UI toolkit for building beautiful, natively compiled
//   applications for mobile, web, and desktop from a single codebase.

//   Dart is the programming language used by Flutter. It's optimized for
//   building user interfaces with features like hot reload.''',
//     chunkSize: 512,
//     chunkOverlap: 50,
//   );
// }

// // Step 5: Ask questions and get context-aware responses
// void getResponse() async {
//   final stream = aiEdgeRag.generateResponseAsync(
//     'What programming language does Flutter use?',
//     topK: 3, // Number of relevant chunks to retrieve
//     minSimilarityScore: 0.3, // Minimum relevance threshold
//   );

//   await for (final event in stream) {
//     print('Response: ${event.partialResult}');

//     if (event.done) {
//       print('Generation completed!');
//     }
//   }
// }

// // Clean up when done
// void cleanUp() async {
//   await aiEdgeRag.close();
// }
