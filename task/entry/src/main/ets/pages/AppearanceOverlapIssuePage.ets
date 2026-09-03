import router from '@ohos.router';

@Entry
@Component
struct AppearanceOverlapIssuePage {
  @State private selectedColor: number = 0;
  @State private appearanceTab: number = 0;
  private colors: string[] = ['#F1F1EF', '#23272B', '#A51E30', '#315B75', '#888D88', '#D9C5A5'];

  @Builder
  private vehicleImage() {
    Stack({ alignContent: Alignment.Bottom }) {
      Row()
        .width('520lpx')
        .height('132lpx')
        .backgroundColor(this.colors[this.selectedColor])
        .border({ width: '2lpx', color: '#AEB5BA' })
        .borderRadius({
          topLeft: '95lpx', topRight: '152lpx', bottomLeft: '24lpx', bottomRight: '24lpx'
        })
      Row() {
        Stack() {
          Text().width('88lpx').height('88lpx').borderRadius('44lpx').backgroundColor('#252A2E')
          Text().width('50lpx').height('50lpx').borderRadius('25lpx').backgroundColor('#778089')
        }
        Stack() {
          Text().width('88lpx').height('88lpx').borderRadius('44lpx').backgroundColor('#252A2E')
          Text().width('50lpx').height('50lpx').borderRadius('25lpx').backgroundColor('#778089')
        }
      }
      .width('400lpx')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: '-30lpx' })
    }
    .width('100%')
    .height('322lpx')
  }

  @Builder
  private headerImageLayer() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Column() {
        this.vehicleImage()
      }
      .width('100%')
      .height('322lpx')
      .margin({ top: '391lpx' })

      Text('*车型配置、图片等信息仅供参考')
        .fontSize('17lpx')
        .fontColor('#9A9FA3')
        .textAlign(TextAlign.End)
        .margin({ right: '35lpx', top: '198lpx' })
        .height('24lpx')
        .width('100%')
    }
    .width('720lpx')
    .height('1083lpx')
    .clip(true)
  }

  @Builder
  private colorItem(color: string, index: number) {
    Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text()
        .width(this.selectedColor === index ? '83lpx' : '77lpx')
        .height(this.selectedColor === index ? '83lpx' : '77lpx')
        .borderRadius(this.selectedColor === index ? '41.5lpx' : '38.5lpx')
        .backgroundColor(color)
      if (this.selectedColor === index) {
        Text('✓')
          .fontSize('27lpx')
          .fontColor(index === 0 ? '#353F48' : Color.White)
          .position({ x: '43lpx', y: '38lpx' })
      }
    }
    .borderRadius(this.selectedColor === index ? '59lpx' : '0lpx')
    .borderColor('#353F48')
    .borderWidth(this.selectedColor === index ? '2lpx' : 0)
    .size(this.selectedColor === index ? { width: '118lpx', height: '118lpx' } : {
      width: '77lpx', height: '77lpx'
    })
    .onClick(() => this.selectedColor = index)
  }

  @Builder
  private colorSelectionLayer() {
    Column({ space: '42lpx' }) {
      Row() {
        Column({ space: '7lpx' }) {
          Text(['铂金珍珠白', '墨晶黑', '珊瑚红', '海钻蓝', '欧泊银', '琥珀棕'][this.selectedColor])
            .fontSize('35lpx')
            .fontColor('#030F1A')
            .height('49lpx')
          Text(this.selectedColor === 0 ? '¥ 2,000' : '价格已包含')
            .fontSize('24lpx')
            .fontColor('#687076')
            .height('35lpx')
        }
        .alignItems(HorizontalAlign.Start)
        Text('有6款颜色供选择，左滑查看')
          .fontSize('21lpx')
          .fontColor('#9A9FA3')
          .height('24lpx')
      }
      .width('100%')
      .alignItems(VerticalAlign.Bottom)
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({ left: '35lpx', right: '35lpx' })

      Scroll() {
        Row({ space: '56lpx' }) {
          ForEach(this.colors, (item: string, index: number) => {
            this.colorItem(item, index)
          })
        }
        .justifyContent(FlexAlign.Start)
      }
      .padding({ left: '35lpx', right: '35lpx' })
      .scrollBar(BarState.Off)
      .scrollable(ScrollDirection.Horizontal)
      .align(Alignment.Start)
      .edgeEffect(EdgeEffect.Spring)
      .height('118lpx')
      .width('100%')
    }
    .height('100%')
    .width('720lpx')
    .justifyContent(FlexAlign.End)
    .padding({ bottom: '139lpx' })
  }

  @Builder
  private topToolbar() {
    Row() {
      Text('‹')
        .fontSize('42lpx')
        .fontColor('#030F1A')
        .onClick(() => router.back())
      Text('外观')
        .fontSize('31lpx')
        .fontWeight(500)
        .fontColor('#030F1A')
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
      Text('返回')
        .fontSize('21lpx')
        .fontColor('#0F4C81')
        .onClick(() => router.back())
    }
    .width('100%')
    .height('83lpx')
    .padding({ left: '28lpx', right: '28lpx' })
  }

  @Builder
  private bottomToolbar() {
    Column() {
      Stack({ alignContent: Alignment.BottomStart }) {
        Row() {
          Text('颜色')
            .width('111lpx')
            .height('100%')
            .fontSize('28lpx')
            .lineHeight('42lpx')
            .padding({ top: '14lpx' })
            .fontWeight(this.appearanceTab === 0 ? 500 : 400)
            .fontColor(this.appearanceTab === 0 ? '#030F1A' : '#687076')
            .textAlign(TextAlign.Center)
            .onClick(() => this.appearanceTab = 0)
          Text('轮毂')
            .width('111lpx')
            .height('100%')
            .fontSize('28lpx')
            .lineHeight('42lpx')
            .padding({ top: '14lpx' })
            .fontWeight(this.appearanceTab === 1 ? 500 : 400)
            .fontColor(this.appearanceTab === 1 ? '#030F1A' : '#687076')
            .textAlign(TextAlign.Center)
            .onClick(() => this.appearanceTab = 1)
        }
        .height('100%')
        Text()
          .width('45lpx')
          .height('3lpx')
          .backgroundColor('#030F1A')
          .margin({ left: this.appearanceTab === 0 ? '33lpx' : '144lpx' })
      }
      .height('83lpx')
      .width('100%')
      .padding({ left: '7lpx', right: '7lpx' })

      Divider().width('100%').height('2lpx').color('#F7F8F8')

      Row() {
        Column() {
          Row({ space: '14lpx' }) {
            Text('¥ 268,800')
              .fontSize('31lpx')
              .fontColor('#030F1A')
              .fontWeight(500)
            Text('⌃')
              .fontSize('28lpx')
              .fontColor('#030F1A')
          }
          .height('49lpx')
          Text('成交价以您和经销商达成的协议为准')
            .fontSize('21lpx')
            .fontColor('#9A9FA3')
            .height('31lpx')
        }
        .alignItems(HorizontalAlign.Start)
        Text('下一步')
          .fontSize('24lpx')
          .fontColor(Color.White)
          .backgroundColor('#07223A')
          .width('209lpx')
          .height('70lpx')
          .borderRadius('7lpx')
          .textAlign(TextAlign.Center)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({ left: '35lpx', right: '35lpx', top: '14lpx' })
      .border({ width: { top: '2lpx' }, color: '#F7F8F9' })
      .height('94lpx')
      .width('100%')
    }
    .width('100%')
    .backgroundColor(Color.White)
  }

  build() {
    Stack({ alignContent: Alignment.BottomStart }) {
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('#EDF1F3')

      Stack({ alignContent: Alignment.TopStart }) {
        this.headerImageLayer()

        // 原版外观页作为 720lpx 宽的横向页面之一，颜色内容与车辆画布同层叠放。
        this.colorSelectionLayer()

        this.topToolbar()
      }
      .width('100%')
      .height('100%')
      .padding({ bottom: '174lpx' })

      this.bottomToolbar()
    }
    .height('100%')
    .width('100%')
  }
}

