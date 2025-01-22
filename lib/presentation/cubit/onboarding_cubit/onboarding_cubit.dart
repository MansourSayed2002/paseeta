import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:paseeta/domain/usecase/onboarding/next_onboarding_page_usecase.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this.nextOnboardingPageUseCase) : super(OnboardingInitial());
  late NextOnboardingPageUseCase nextOnboardingPageUseCase;
  int indexpage = 0;

  PageController pagecontroller = PageController();

  next() {
    nextOnboardingPageUseCase.next(indexpage, pagecontroller);
  }

  changeindexpage(value) {
    indexpage = value;
  }
}
