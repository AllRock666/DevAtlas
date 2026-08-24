# DevAtlas 🗺️

DevAtlas is a developer-centric knowledge ingestion, tracking, and study system built with Flutter. It allows developers to import programming documentation, automatically extract key concepts and relationships, map them to learning roadmaps, and perform active recall study using an integrated spaced-repetition revision engine.

---

## 🚀 Key Features

*   **Documentation Ingestion Pipeline**: Fetch remote web articles/documentation, parse content structurally into semantic blocks, and index them.
*   **Knowledge Extraction**: Identify primary programming concepts, tags, and cross-concept relationships directly from ingested materials.
*   **Spaced-Repetition Revision Engine**: Keep concepts fresh with a customized daily study queue using card-level active recall (Understood, Practiced, Mastered status tracking).
*   **Interactive Learning Roadmaps**: Track progress across curated pathways (e.g., C++ development) and dynamically attach incoming parsed knowledge cards to relevant nodes.
*   **Stable Block-Level Annotations**: Attach, display, and anchor study notes directly onto specific parts of documentation pages using stable md5 block IDs.
*   **Offline-First Architecture**: Powered by a robust SQLite database for seamless offline access.

---

## 🛠️ Architecture & Core Engines

DevAtlas employs a clean, modular engine-based architecture:

1.  **`ContentSourceEngine`**
    *   Manages the retrieval of HTML pages (utilizing a polite CORS proxy).
    *   Coordinates the extraction of structural content blocks and invokes the `KnowledgeExtractionEngine` to map relationships.
    *   Handles the heuristics for automatically associating newly ingested cards with relevant roadmaps and nodes.
2.  **`RevisionEngine`**
    *   Generates daily review queues dynamically based on learning history.
    *   Supports multiple card revision prompts (concept definitions, source material recall, and relationship associations).
3.  **`RoadmapEngine`**
    *   Manages user pathways, progress tracking, and module organization.
    *   Includes a fast app-start seeding safeguard that avoids redundant database writes if curated roadmaps are already populated.
4.  **`ImportQueueManager`**
    *   Provides background-safe job queuing to import pages sequentially without blocking user interaction.
    *   Features manual queue controls (pause, resume, retry, cancel).

---

## ⚙️ Tech Stack

*   **Framework**: [Flutter](https://flutter.dev) (iOS, Android, Web)
*   **State Management**: [Riverpod](https://riverpod.dev)
*   **Local Database**: [Drift](https://drift.simonbinder.eu) (SQLite)
*   **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it)
*   **Routing**: [GoRouter](https://pub.dev/packages/go_router)
*   **Parser & Renderers**: [html](https://pub.dev/packages/html) & [flutter_markdown](https://pub.dev/packages/flutter_markdown)
*   **Syntax Highlighting**: [flutter_highlighter](https://pub.dev/packages/flutter_highlighter)

---

## 📦 Getting Started

### Prerequisites

*   Flutter SDK (v3.12.2 or higher)
*   Android SDK / iOS build tools (depending on target platform)

### Run the App

1.  Clone the repository and navigate to the project directory:
    ```bash
    git clone https://github.com/AllRock666/DevAtlas.git
    cd DevAtlas
    ```
2.  Install dependencies:
    ```bash
    flutter pub get
    ```
3.  Run code generation (if Drift/Riverpod files need rebuilding):
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
4.  Launch the application:
    ```bash
    flutter run
    ```

### Package App for Mobile (Android APK)

To build a release-ready APK for your Android device:
```bash
flutter build apk --release
```
*Note: Incremental Kotlin compilation is disabled in `android/gradle.properties` (`kotlin.incremental=false`) to ensure clean builds across differing host drives.*

---

## 🗄️ Database Schema Outline

The persistence layer relies on Drift:
*   `KnowledgeCards`: Stores the primary ingested pages, metadata, and extracted knowledge JSON blocks.
*   `ExtractedConcepts`: Individual concepts mapped from cards.
*   `ConceptRelationships`: Directed edges tracking dependencies between programming concepts.
*   `LearningProgress`: Spaced-repetition card state logs (difficulty, state, last reviewed).
*   `Roadmaps` / `RoadmapModules` / `RoadmapNodes`: Structure and completion metadata for user learning pathways.
