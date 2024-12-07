import 'package:dartz/dartz.dart';
import 'package:intersect_task/core/networking/failure.dart';

typedef ApiResult<T> = Either<Failure, T>;
