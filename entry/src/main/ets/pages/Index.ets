@Entry
@Component
struct Index {
  // 随机生成1-100的目标数字
  private targetNum: number = Math.floor(Math.random() * 100) + 1;
  @State userInput: string = '';
  @State tipText: string = '我想了一个1-100的数字，猜猜看？';
  @State count: number = 0;

  build() {
    Column({ space: 20 }) {
      Text(this.tipText)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      TextInput({ text: this.userInput, placeholder: '输入数字' })
        .type(InputType.Number)
        .width('80%')
        .height(50)
        .onChange((value: string) => {
          this.userInput = value;
        })

      Button('提交猜测')
        .width('60%')
        .onClick(() => {
          const guess = parseInt(this.userInput);
          if (isNaN(guess)) {
            this.tipText = '请输入有效数字！';
            return;
          }
          this.count++;
          if (guess === this.targetNum) {
            this.tipText = `🎉猜对啦！你用了${this.count}次！`;
          } else if (guess < this.targetNum) {
            this.tipText = '猜小了，再试试？';
          } else {
            this.tipText = '猜大了，再试试？';
          }
          this.userInput = '';
        })

      Button('重新开始')
        .width('60%')
        .backgroundColor('#00BFFF')
        .onClick(() => {
          this.targetNum = Math.floor(Math.random() * 100) + 1;
          this.count = 0;
          this.tipText = '我想了一个1-100的数字，猜猜看？';
          this.userInput = '';
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding(20)
  }
}