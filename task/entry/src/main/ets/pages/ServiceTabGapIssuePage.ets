import router from '@ohos.router';

@Entry
@Component
struct ServiceTabGapIssuePage {
  @State private currentTab: number = 0;
  @State private experienceMode: boolean = true;
  private pageScroller: Scroller = new Scroller();

  @Builder
  private vehicleHeader() {
    if (this.experienceMode) {
      Row() {
        Text() {
          Span('虚拟车联网')
            .fontColor('#030F1A')
          Span(' 体验模式')
            .fontColor('#D56B4B')
        }
        .fontSize('35lpx')
        .fontWeight(600)
        .layoutWeight(1)
        Button('去绑车')
          .fontSize('24lpx')
          .fontColor('#07223A')
          .width('104lpx')
          .height('49lpx')
          .backgroundColor('#00FFFFFF')
          .border({ color: '#07223A', width: '2lpx', radius: '7lpx' })
      }
      .width('100%')
      .height('209lpx')
      .padding({ left: '35lpx', right: '35lpx', top: '78lpx' })
      .alignItems(VerticalAlign.Center)
      .backgroundColor('#F8FAFA')
      .borderRadius({ bottomLeft: '20lpx', bottomRight: '20lpx' })
    } else {
      Stack({ alignContent: Alignment.TopStart }) {
        Column()
          .width('100%')
          .height('209lpx')
          .backgroundColor('#DCEAF3')
        Row({ space: '35lpx' }) {
          Column({ space: '10lpx' }) {
            Row({ space: '12lpx' }) {
              Text('我的锋兰达')
                .fontSize('31lpx')
                .fontWeight(500)
                .fontColor('#010106')
              Text('⌄')
                .fontSize('28lpx')
                .fontColor('#010106')
            }
            Text('粤A · F8888')
              .fontSize('24lpx')
              .fontColor('#687076')
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)
          Column({ space: '6lpx' }) {
            Text('◉').fontSize('42lpx').fontColor('#07223A')
            Text('客服').fontSize('21lpx').fontColor('#687076')
          }
          Column({ space: '6lpx' }) {
            Text('⚙').fontSize('42lpx').fontColor('#07223A')
            Text('设置').fontSize('21lpx').fontColor('#687076')
          }
        }
        .width('100%')
        .height('83lpx')
        .padding({ left: '35lpx', right: '35lpx' })
        .margin({ top: '90lpx' })
        .alignItems(VerticalAlign.Top)
      }
      .width('100%')
      .height('209lpx')
    }
  }

  @Builder
  private maintenanceBadge() {
    Stack() {
      Image($r('app.media.icon_service_maintenance_title_bg_1'))
        .height('38lpx')
        .width('150lpx')
        .objectFit(ImageFit.Fill)
      Text('距下次保养2天')
        .fontColor('#8C5C39')
        .fontSize('19lpx')
        .lineHeight('19lpx')
        .height('38lpx')
        .padding({ left: '10lpx', right: '10lpx', top: '8lpx' })
    }
    .height('38lpx')
  }

  @Builder
  private stickyTabHeader() {
    Stack({ alignContent: Alignment.TopStart }) {
      Row() {
        Image(this.currentTab === 0 ? $r('app.media.icon_my_car_top_tab_fyyx') :
          $r('app.media.icon_my_car_top_fyyx_unsel'))
          .objectFit(ImageFit.Contain)
          .padding({ left: '31lpx', right: '19lpx' })
          .height('43lpx')
          .onClick(() => this.currentTab = 0)

        Stack({ alignContent: Alignment.TopStart }) {
          Text('服务')
            .fontSize(this.currentTab === 1 ? '31lpx' : '27lpx')
            .fontWeight(this.currentTab === 1 ? 500 : 400)
            .fontColor(this.currentTab === 1 ? '#030F1A' : '#687076')
            .height('83lpx')
            .padding({ left: '19lpx', right: '19lpx' })
            .textAlign(TextAlign.Center)
          Column() {
            this.maintenanceBadge()
          }
          .position({ x: '83lpx', y: 0 })
        }
        .height('83lpx')
        .onClick(() => this.currentTab = 1)
      }
      .width('100%')
      .height('83lpx')

      Image($r('app.media.icon_my_car_top_tab_bottom'))
        .objectFit(ImageFit.Contain)
        .width('43lpx')
        .height('6lpx')
        .margin({ left: this.currentTab === 0 ? '83lpx' : '300lpx', top: '65lpx' })
    }
    .width('100%')
    .height('83lpx')
    .backgroundColor(Color.White)
    .zIndex(5)
  }

  @Builder
  private controlButton(symbol: string, label: string) {
    Column({ space: '7lpx' }) {
      Text(symbol)
        .fontSize('35lpx')
        .fontColor('#07223A')
        .width('70lpx')
        .height('70lpx')
        .textAlign(TextAlign.Center)
        .backgroundColor('#EDF3F6')
        .borderRadius('35lpx')
      Text(label).fontSize('21lpx').fontColor('#353F48')
    }
  }

  @Builder
  private boundCarContent() {
    Column({ space: 0 }) {
      Stack({ alignContent: Alignment.Center }) {
        Column()
          .width('100%')
          .height('430lpx')
          .backgroundColor('#D7E5EE')
        Column({ space: '8lpx' }) {
          Text('车辆状态').fontSize('21lpx').fontColor('#687076')
          Text('车辆已锁定').fontSize('35lpx').fontWeight(600).fontColor('#142A3B')
          Stack({ alignContent: Alignment.Bottom }) {
            Row()
              .width('390lpx')
              .height('112lpx')
              .backgroundColor('#AEB9C1')
              .borderRadius({
                topLeft: '82lpx', topRight: '120lpx', bottomLeft: '18lpx', bottomRight: '18lpx'
              })
            Row() {
              Text().width('70lpx').height('70lpx').borderRadius('35lpx').backgroundColor('#252A2E')
              Text().width('70lpx').height('70lpx').borderRadius('35lpx').backgroundColor('#252A2E')
            }
            .width('310lpx')
            .justifyContent(FlexAlign.SpaceBetween)
            .margin({ bottom: '-22lpx' })
          }
          .width('440lpx')
          .height('165lpx')
        }
      }
      .width('100%')
      .height('430lpx')

      Row() {
        this.controlButton('◉', '车锁')
        this.controlButton('⌁', '空调')
        this.controlButton('◇', '车窗')
        this.controlButton('◎', '寻车')
      }
      .width('100%')
      .height('150lpx')
      .padding({ left: '28lpx', right: '28lpx' })
      .justifyContent(FlexAlign.SpaceBetween)
      .backgroundColor(Color.White)

      this.serviceCards()
    }
    .width('100%')
  }

  @Builder
  private experienceContent() {
    Column() {
      Stack({ alignContent: Alignment.TopStart }) {
        Column()
          .width('100%')
          .height('430lpx')
          .backgroundColor('#F4F8FA')

        Text('体验模式仅展示最新款车型功能，实际以绑定车辆页面为准')
          .fontSize('24lpx')
          .fontColor('#687076')
          .width('94%')
          .height('49lpx')
          .padding({ left: '14lpx', right: '14lpx', top: '8lpx' })
          .backgroundColor('#D9D9FF')
          .borderRadius('7lpx')
          .margin({ left: '21lpx', top: '21lpx' })

        Text('575')
          .fontSize('80lpx')
          .fontWeight(500)
          .fontColor('#030F1A')
          .margin({ left: '14lpx', top: '94lpx' })
        Text('km')
          .fontSize('35lpx')
          .fontColor('#030F1A')
          .margin({ left: '126lpx', top: '157lpx' })
        Text('⚿ 数字钥匙')
          .fontSize('28lpx')
          .fontColor('#07223A')
          .padding({ left: '24lpx', right: '24lpx', top: '12lpx', bottom: '12lpx' })
          .border({ width: '2lpx', color: '#8DC8E8', radius: '35lpx' })
          .margin({ left: '440lpx', top: '125lpx' })
        Text('⛽ 48.2%')
          .fontSize('28lpx')
          .fontColor('#687076')
          .margin({ left: '14lpx', top: '235lpx' })
      }
      .width('100%')
      .height('430lpx')

      this.serviceCards()
    }
    .width('100%')
  }

  @Builder
  private serviceCards() {
    Column({ space: '14lpx' }) {
      Row({ space: '14lpx' }) {
        this.largeServiceCard('−     26     ＋', '空调温度')
        this.largeServiceCard('▱', '下发寻车指令')
      }
      ForEach([1, 2, 3], (item: number) => {
        Row() {
          Text(`爱车服务 ${item}`).fontSize('27lpx').fontWeight(500).fontColor('#030F1A')
          Text('查看详情 ›').fontSize('23lpx').fontColor('#0F4C81')
        }
        .width('100%')
        .height('112lpx')
        .padding({ left: '28lpx', right: '28lpx' })
        .justifyContent(FlexAlign.SpaceBetween)
        .backgroundColor(Color.White)
        .borderRadius('14lpx')
      })
    }
    .width('100%')
    .padding({ left: '28lpx', right: '28lpx', top: '21lpx', bottom: '180lpx' })
    .backgroundColor('#F2F4F6')
  }

  @Builder
  private largeServiceCard(value: string, label: string) {
    Column({ space: '21lpx' }) {
      Text(value).fontSize('42lpx').fontColor('#030F1A')
      Text(label).fontSize('24lpx').fontColor('#687076')
    }
    .width('315lpx')
    .height('210lpx')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.White)
    .borderRadius('14lpx')
  }

  @Builder
  private nativeServiceContent() {
    Column() {
      this.serviceCards()
    }
    .width('100%')
  }

  @Builder
  private hostNavigation() {
    Row() {
      this.navItem('◉', '发现', false)
      this.navItem('♥', '服务', true)
      this.navItem('▱', '购车', false)
      this.navItem('♧', '商城', false)
      this.navItem('♙', '我的', false)
    }
    .width('100%')
    .height('118lpx')
    .padding({ left: '28lpx', right: '28lpx', bottom: '14lpx' })
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
  }

  @Builder
  private navItem(symbol: string, label: string, selected: boolean) {
    Column({ space: '7lpx' }) {
      Text(symbol).fontSize('28lpx').fontColor(selected ? '#07223A' : '#687076')
      Text(label).fontSize('19lpx').fontColor(selected ? '#07223A' : '#687076')
    }
    .width('90lpx')
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      List({ scroller: this.pageScroller, space: 0 }) {
        ListItem() {
          this.vehicleHeader()
        }

        ListItemGroup({ header: this.stickyTabHeader }) {
          ListItem() {
            Column() {
              if (this.currentTab === 0) {
                if (this.experienceMode) {
                  this.experienceContent()
                } else {
                  this.boundCarContent()
                }
              } else {
                this.nativeServiceContent()
              }
            }
            .width('100%')
            // 8 月 7 日原版把内容绝对放在 149lpx；正常流位置是 292lpx，等价于上移 143lpx。
            .offset({ y: '-143lpx' })
          }
        }
      }
      .width('100%')
      .height('100%')
      .padding({ bottom: '118lpx' })
      .sticky(StickyStyle.Header)
      .edgeEffect(EdgeEffect.None)
      .scrollBar(BarState.Off)
      .clip(false)
      .backgroundColor(Color.White)

      Column() {
        this.hostNavigation()
      }
      .zIndex(8)

      Row({ space: 8 }) {
        Text(this.experienceMode ? '切换保客' : '切换体验车')
          .fontSize(12)
          .fontColor('#0F4C81')
          .padding({ left: 12, right: 12, top: 8, bottom: 8 })
          .backgroundColor('#EEFFFFFF')
          .borderRadius(16)
          .onClick(() => {
            this.experienceMode = !this.experienceMode;
            this.pageScroller.scrollToIndex(0);
          })
        Text('返回')
          .fontSize(12)
          .fontColor('#0F4C81')
          .padding({ left: 12, right: 12, top: 8, bottom: 8 })
          .backgroundColor('#EEFFFFFF')
          .borderRadius(16)
          .onClick(() => router.back())
      }
      .align(Alignment.TopEnd)
      .margin({ top: 10, right: 12 })
      .zIndex(10)
    }
    .width('100%')
    .height('100%')
  }
}
