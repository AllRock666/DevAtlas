import '../storage/database.dart';

final List<KnowledgeCard> mockKnowledgeCards = [
  const KnowledgeCard(
    id: 'linked_list',
    title: 'Linked List',
    explanation: 'A linked list is a linear data structure, in which the elements are not stored at contiguous memory locations. Instead, elements are linked using pointers.',
    tags: 'Data Structure, Linear',
    difficulty: 'Beginner',
    timeComplexity: 'O(N) Search, O(1) Insert/Delete (at known pointer)',
    spaceComplexity: 'O(N)',
    sources: '[]',
    revisionNotes: '',
    contentVersion: 1,
    schemaVersion: 1,
    importStatus: 'completed',
  ),
  const KnowledgeCard(
    id: 'arrays',
    title: 'Array',
    explanation: 'An array is a collection of items stored at contiguous memory locations. It is designed to store multiple items of the same type together for O(1) index access.',
    tags: 'Data Structure, Linear',
    difficulty: 'Beginner',
    timeComplexity: 'O(1) Access, O(N) Search/Insert/Delete',
    spaceComplexity: 'O(N)',
    sources: '[]',
    revisionNotes: '',
    contentVersion: 1,
    schemaVersion: 1,
    importStatus: 'completed',
  ),
];
