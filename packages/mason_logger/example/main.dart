import 'package:mason_logger/mason_logger.dart';

Future<void> main() async {
  final logger = Logger(level: Level.verbose)
    ..info('info')
    ..alert('alert')
    ..err('error')
    ..success('success')
    ..warn('warning')
    ..detail('detail')
    ..info('');

  final favoriteColor = logger.chooseOne(
    'Pick a color.',
    choices: ['red', 'green', 'blue'],
    defaultValue: 'blue',
  );

  logger.info('Got it, $favoriteColor it is!');

  final desserts = logger.chooseAny(
    'Which desserts do you like?',
    choices: ['🍦', '🍪', '🍩'],
  );

  logger.info('Awesome, $desserts it is!');

  final favoriteAnimal = logger.prompt(
    'What is your favorite animal?',
    defaultValue: '🐈',
  );
  final likesCats = logger.confirm('Do you like cats?', defaultValue: true);
  final progress = logger.progress('Calculating');
  await Future<void>.delayed(const Duration(milliseconds: 500));
  progress.update('Halfway!');
  await Future<void>.delayed(const Duration(milliseconds: 500));
  progress.complete('Done!');
  logger
    ..info('Your favorite animal is a $favoriteAnimal!')
    ..alert(likesCats ? 'You are a cat person!' : 'You are not a cat person.');

  final failing = logger.progress('Trying to fail now!');
  await Future<void>.delayed(const Duration(seconds: 1));
  failing.fail('See I failed!');

  final canceling = logger.progress('Trying to cancel now!');
  await Future<void>.delayed(const Duration(seconds: 1));
  canceling.cancel();
  logger.info('Done!');
}
