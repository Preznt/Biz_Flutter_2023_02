# flutter_pomodoros_001

### duration

### flutter_time_picker_spinner

`flutter pub add flutter_time_picker_spinner`

## 프로젝트 진행하면서 알게된 내용

### 3/13

- void : 리턴이 없는 자료형을 말한다.

## 오류

### 3/13

```
final DateTime _dateTime = DateTime(0, 0, 0, 0, 0);
int _finalSecond =_dateTime.hour * 3600 + _dateTime.minute * 60 + _dateTime.second;
```

#### late keyword

- 위의 코드에서 `instance member can't be accessed in an initializer` 라는 오류 발생
  => 변수 앞에 late 를 붙여주니 해결됨
  왜?? 인스턴스 멤버는 초기화를 진행할 수 없다
  \_dateTime에 값이 먼저 들어간 이후에 초기화가 되어야 해서 late를 붙여야하는 건가
- late 키워드는 그 변수가 사용되기 전까지 초기화가 되지 않고 남겨두다가 사용될 때 초기화 된다(Null Saftey Update)
