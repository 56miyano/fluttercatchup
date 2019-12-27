# バイト給料計算機

バイトの給料を計算するアプリ

## 作った理由

給料日前でもお給料が知りたい時があるから

## 変数

|変数名  |変数型  |役割  |
|---|---|---|
|totalFee|double|MyWage上に表示される合計の給料額|
|dailySalaryList|List<String>|日給をリスト表示するための配列　(選んだ日付) + "の給料　　" + (InputPageから受け取った値を文字列型に変換したもの) +"円　　合計金額　　" + '$その時点での合計金額'|
|selectedDate|String|選んだ日付|
|stringResult|String|InputPageから受け取った値を文字列型に変換したもの|
|dailySalary|double|日給 InputPageの上に表示される数字であり、かつMyHomePageに渡す値|
|hourlyWage|double|時給　時給を入力したテキストを小数型に変える|
|under8hFrom8to22|double|8時間を超えずに行った8~22時の労働時間を入力したテキストを小数型に変える 給与計算時に1倍される|
|over8hFrom8to22|double|8時間を超えて行った8~22時の労働時間を入力したテキストを小数型に変える 給与計算時に1.25倍される|
|under8hFrom22to5|double|8時間を超えずに行った22~5時の労働時間を入力したテキストを小数型に変える 給与計算時に1.25倍される|
|over8hFrom22to5|double|8時間を超えて行った22~5時の労働時間を入力したテキストを小数型に変える 給与計算時に1.5倍される|

## 使用画面

![1](img/画面1.png)
![2](img/画面2.png)
![3](img/画面3.png)

