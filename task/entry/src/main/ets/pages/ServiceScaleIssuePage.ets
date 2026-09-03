import router from '@ohos.router';

@Entry
@Component
struct ServiceScaleIssuePage {
  @Builder
  private serviceTile(symbol: string, title: string, description: string) {
    Column({ space: '12lpx' }) {
      Text(symbol)
        .fontSize('56lpx')
        .width('91lpx')
        .height('91lpx')
        .textAlign(TextAlign.Center)
        .backgroundColor('#E8F1F8')
        .borderRadius('18lpx')
      Text(title)
        .fontSize('27lpx')
        .fontWeight(500)
        .fontColor('#030F1A')
      Text(description)
        .fontSize('21lpx')
        .fontColor('#9A9FA3')
        .maxLines(1)
    }
    .width('210lpx')
    .height('230lpx')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.White)
    .borderRadius('14lpx')
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.TopStart }) {
        Column()
          .width('100%')
          .height('209lpx')
          .backgroundColor('#DCEAF4')
        Row() {
          Column({ space: '14lpx' }) {
            Text('我的汉兰达')
              .fontSize('31lpx')
              .fontWeight(500)
              .fontColor('#010106')
            Text('粤A · 8F888')
              .fontSize('24lpx')
              .fontColor('#687076')
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)
          Text('在线客服')
            .fontSize('24lpx')
            .fontColor('#0F4C81')
        }
        .height('100%')
        .width('100%')
        .padding({ left: '35lpx', right: '35lpx', top: '49lpx' })
        Text('返回')
          .fontSize('21lpx')
          .fontColor('#0F4C81')
          .position({ x: '620lpx', y: '14lpx' })
          .onClick(() => router.back())
      }
      .width('100%')
      .height('209lpx')

      Stack({ alignContent: Alignment.Start }) {
        Row() {
          Text('爱车')
            .fontSize('27lpx')
            .fontColor('#687076')
            .width('120lpx')
            .height('83lpx')
            .textAlign(TextAlign.Center)
          Text('服务')
            .fontSize('31lpx')
            .fontWeight(500)
            .fontColor('#030F1A')
            .width('120lpx')
            .height('83lpx')
            .textAlign(TextAlign.Center)
        }
        Text()
          .width('43lpx')
          .height('6lpx')
          .backgroundColor('#07223A')
          .margin({ left: '159lpx', top: '65lpx' })
      }
      .width('100%')
      .height('83lpx')
      .backgroundColor(Color.White)

      Scroll() {
        Column({ space: '21lpx' }) {
          Text('常用服务')
            .fontSize('31lpx')
            .fontWeight(500)
            .fontColor('#030F1A')
            .width('100%')
          Row({ space: '21lpx' }) {
            this.serviceTile('⌁', '预约保养', '到店免排队')
            this.serviceTile('♧', '道路救援', '24 小时服务')
            this.serviceTile('◇', '违章查询', '出行更安心')
          }
          Row({ space: '21lpx' }) {
            this.serviceTile('◉', '附近经销商', '查找最近门店')
            this.serviceTile('▣', '维修进度', '实时了解状态')
            this.serviceTile('☆', '服务评价', '分享服务体验')
          }
        }
        .padding('35lpx')
      }
      .layoutWeight(1)
      .backgroundColor('#F7F8FA')
    }
    .width('100%')
    .height('100%')
  }
}

