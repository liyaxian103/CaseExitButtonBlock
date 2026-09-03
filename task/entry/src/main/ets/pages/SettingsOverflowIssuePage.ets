import router from '@ohos.router';

@Entry
@Component
struct SettingsOverflowIssuePage {
  private titles: string[] = [
    '账号与安全', '消息推送', '丰云悦享车联网', '通用设置', '功能建议',
    '问卷调查', '服务协议', '关于我们', '清理本地缓存', '当前版本', '检查更新'
  ];

  @Builder
  private settingItem(title: string, index: number) {
    Flex({ alignItems: ItemAlign.Center }) {
      Column({ space: '2lpx' }) {
        Text(title)
          .fontSize('27lpx')
          .lineHeight('38lpx')
          .fontColor('#303030')
        if (index === 1) {
          Text('免打扰 22:00-次日08:00')
            .fontSize('23lpx')
            .lineHeight('38lpx')
            .fontColor('#666666')
        }
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      if (index === 1) {
        Text('已开启')
          .fontSize('27lpx')
          .lineHeight('38lpx')
          .fontColor('#989898')
      }
      Text(index === 8 || index === 9 ? '' : '›')
        .fontSize('32lpx')
        .fontColor('#989898')
    }
    .width('94%')
    .height(48)
    .border({ width: { bottom: 1 }, color: '#F0F0F0' })
    .backgroundColor(Color.White)
    .id(`settings-menu-item-${index}`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      Row() {
        Text('‹')
          .fontSize('42lpx')
          .fontColor('#010106')
          .onClick(() => router.back())
        Text('设置')
          .fontSize('31lpx')
          .fontWeight(500)
          .fontColor('#010106')
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        Text('返回')
          .fontSize('21lpx')
          .fontColor('#0F4C81')
          .onClick(() => router.back())
      }
      .height('94lpx')
      .width('100%')
      .padding({ left: '28lpx', right: '28lpx' })
      .backgroundColor(Color.White)

      Column() {
        ForEach(this.titles, (item: string, index: number) => {
          this.settingItem(item, index)
          if (index === 3) {
            Divider().height(10).color('#F7F8FA')
          }
        })
      }
      .width('100%')
      .flexGrow(1)
      .backgroundColor(Color.White)
      .id('settings-function-menu')

      Row() {
        Text('退出登录')
          .fontSize(16)
          .fontColor('#393939')
      }
      .backgroundColor(Color.White)
      .justifyContent(FlexAlign.Center)
      .width('90%')
      .height('84lpx')
      .border({ width: 1, color: '#AEAEAE', radius: 4 })
      .margin({ bottom: '35lpx', top: '35lpx' })
      .id('settings-logout-button')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F7F8FA')
    .id('settings-page-root')
  }
}

