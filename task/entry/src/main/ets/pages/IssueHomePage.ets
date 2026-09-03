import router from '@ohos.router';

@Entry
@Component
struct IssueHomePage {
  @Builder
  private issueCard(index: string, title: string, commit: string, detail: string, url: string) {
    Button() {
      Row({ space: 16 }) {
        Text(index)
          .fontSize(15)
          .fontWeight(600)
          .fontColor(Color.White)
          .width(38)
          .height(38)
          .textAlign(TextAlign.Center)
          .backgroundColor('#0F4C81')
          .borderRadius(19)
        Column({ space: 5 }) {
          Row() {
            Text(title)
              .fontSize(17)
              .fontWeight(600)
              .fontColor('#18212B')
              .layoutWeight(1)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
            Text(commit)
              .fontSize(11)
              .fontColor('#687076')
          }
          .width('100%')
          Text(detail)
            .fontSize(13)
            .fontColor('#687076')
            .width('100%')
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
        Text('›')
          .fontSize(28)
          .fontColor('#9A9FA3')
      }
      .width('100%')
      .padding(16)
    }
    .type(ButtonType.Normal)
    .stateEffect(true)
    .width('100%')
    .height(86)
    .padding(0)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .onClick(() => {
      router.pushUrl({ url: url });
    })
  }

  build() {
    Column() {
      Column({ space: 6 }) {
        Text('丰云行 Issue 原始问题页')
          .fontSize(24)
          .fontWeight(700)
          .fontColor('#101820')
        Text('已排除登录页 · 选择页面后请旋转或调整窗口尺寸')
          .fontSize(13)
          .fontColor('#687076')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 20, right: 20, top: 22, bottom: 16 })

      Scroll() {
        Column({ space: 12 }) {
          this.issueCard('01', '设置页内容溢出', '764c9856', '长列表不可滚动，底部退出按钮在矮窗口中被挤出。',
            'pages/SettingsOverflowIssuePage')
          this.issueCard('02', '服务页比例失真', '764c9856', '页头和 Tab 使用 lpx，宽屏/横屏下随宽度异常放大。',
            'pages/ServiceScaleIssuePage')
          this.issueCard('03', '隐私协议弹窗越界', 'f0e31fd4', '弹窗固定 557lpx × 769lpx，操作按钮可能不可达。',
            'pages/AgreementOverflowIssuePage')
          this.issueCard('04', '外观页车辆重叠', '08-07 原版', '直板机颜色区贴底；宽屏 lpx 拉伸后覆盖车辆图像。',
            'pages/AppearanceOverlapIssuePage')
          this.issueCard('05', '服务页 Tab 内容重叠', '08-07 原版', '内容从正常 292lpx 起点错放到 149lpx，并被吸顶 Tab 遮挡。',
            'pages/ServiceTabGapIssuePage')
        }
        .width('100%')
        .padding({ left: 20, right: 20, bottom: 24 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F6F8')
  }
}
