import router from '@ohos.router';

@Entry
@Component
struct AgreementOverflowIssuePage {
  @Builder
  private paragraph(text: string) {
    Text(`        ${text}`)
      .fontSize('28lpx')
      .fontWeight(400)
      .lineHeight('42lpx')
      .fontColor('#262626')
      .width('100%')
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Column({ space: 16 }) {
        Text('首次启动页')
          .fontSize(26)
          .fontWeight(700)
          .fontColor(Color.White)
        Text('背景仅用于展示原始协议弹窗尺寸问题')
          .fontSize(14)
          .fontColor('#CCFFFFFF')
        Text('返回首页')
          .fontSize(14)
          .fontColor(Color.White)
          .padding({ left: 18, right: 18, top: 10, bottom: 10 })
          .border({ width: 1, color: Color.White, radius: 20 })
          .onClick(() => router.back())
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#31526D')

      Column() {
        Text('服务协议与隐私政策')
          .fontSize('32lpx')
          .fontWeight(500)
          .fontColor('#262626')
          .lineHeight('49lpx')
          .margin({ bottom: '21lpx' })

        Scroll() {
          Column({ space: '18lpx' }) {
            this.paragraph('欢迎您使用丰云行！我们非常重视您的个人信息和隐私保护。在使用服务前，请您认真阅读并充分理解用户协议、隐私政策及未成年人个人信息保护规则。')
            this.paragraph('为向您提供购车及车联网服务，我们可能处理注册手机号、姓名、车辆识别码、车牌号等必要信息。其他扩展业务将在获得您的单独同意后提供。')
            this.paragraph('如果您不同意以上协议，您将暂时无法使用丰云行。点击“同意”即表示您已阅读并同意以上协议的全部内容。')
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
        }
        .width('100%')
        .height('428lpx')

        Column() {
          Button('同意', { type: ButtonType.Normal })
            .fontSize('28lpx')
            .fontWeight(500)
            .fontColor(Color.White)
            .width('100%')
            .height('70lpx')
            .backgroundColor('#0F4C81')
            .borderRadius('3lpx')
          Button('不同意', { type: ButtonType.Normal })
            .fontSize('28lpx')
            .fontWeight(500)
            .fontColor('#262626')
            .width('100%')
            .height('70lpx')
            .backgroundColor(Color.White)
            .border({ width: '2lpx', color: '#666666', radius: '3lpx' })
            .margin({ top: '21lpx' })
            .onClick(() => router.back())
        }
        .width('100%')
        .padding({ top: '35lpx' })
      }
      .borderRadius('14lpx')
      .backgroundColor(Color.White)
      .alignItems(HorizontalAlign.Center)
      .width('557lpx')
      .height('769lpx')
      .padding({ top: '42lpx', left: '42lpx', bottom: '35lpx', right: '42lpx' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('rgba(0,0,0,0.5)')
  }
}

