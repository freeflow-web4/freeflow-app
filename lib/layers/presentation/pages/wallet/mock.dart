import 'package:freeflow/layers/domain/entities/transcript_entity.dart';

abstract class MockTranscript {
  static final List<TranscriptEntity> transcripts = [
    TranscriptEntity(
      amount: '102',
      category: 'gratitude',
      createdAt: '6 ds 21h',
      gratitudeType: 'NFT',
      userName: 'fulano',
    ),
    TranscriptEntity(
      amount: '102',
      category: 'gratitude',
      createdAt: '6 ds 21h',
      gratitudeType: 'NFT',
      userName: 'fulano',
    ),
    TranscriptEntity(
      amount: '102',
      category: 'flower_exchange',
      createdAt: '6 ds 21h',
      gratitudeType: 'NFT',
      userName: 'fulano',
    ),
    TranscriptEntity(
      amount: '102',
      category: 'inter_action',
      createdAt: '6 ds 21h',
      gratitudeType: 'NFT',
      userName: 'fulano',
    ),
    TranscriptEntity(
      amount: '102',
      category: 'inter_action',
      createdAt: '6 ds 21h',
      gratitudeType: 'NFT',
      userName: 'fulano',
    ),
  ];
}
