import { afterAll, beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { window } from '@kit.ArkUI';
import { findLogoutButton, openSettingsPage, startAbility, verifyFontsMatchPhoneReference } from './TestHelper';

export default function passToPassTest() {
  describe('PassToPassTest', () => {
    let driver: Driver;
    let bundleName: string;

    beforeAll(async () => {
      try {
        driver = Driver.create();
        bundleName = abilityDelegatorRegistry.getArguments().bundleName;
        await startAbility(driver, bundleName);
        await openSettingsPage(driver);
      } catch (e) {
        console.error('PassToPassTest beforeAll error: ' + JSON.stringify(e));
      }
    })

    afterAll(async () => {
      try {
        await driver.waitForIdle(2000, 3000);
      } catch (e) {
        console.error('PassToPassTest afterAll error: ' + JSON.stringify(e));
      }
    })

    it('should_start_ability_successfully', Level.LEVEL0, async (done: Function) => {
      try {
        let page = await driver.findComponent(ON.id('settings-page'));
        if (page === null) {
          page = await driver.findComponent(ON.id('settings-page-root'));
        }
        expect(page !== null).assertTrue();
        await driver.delayMs(500);
      } catch (e) {
        console.error('should_start_ability_successfully error: ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    })

    it('should_show_logout_button', Level.LEVEL0, async (done: Function) => {
      try {
        const logout = await findLogoutButton(driver, bundleName);
        expect(logout !== null).assertTrue();
      } catch (e) {
        console.error('should_show_logout_button error: ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    })

    it('should_keep_font_visual_size_on_phone', Level.LEVEL1, async (done: Function) => {
      try {
        const ability = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
        const appWindow = await window.getLastWindow(ability.context);
        const uiContext = appWindow.getUIContext();
        const rect = appWindow.getWindowProperties().windowRect;
        const widthVp = uiContext.px2vp(rect.width);

        const isReferencePhoneWindow = Math.abs(widthVp - 360) <= 1 && rect.height > rect.width;
        if (isReferencePhoneWindow) {
          await openSettingsPage(driver);
          console.info(`verify unchanged phone fonts at ${widthVp}vp`);
          await verifyFontsMatchPhoneReference(driver);
        } else {
          console.info(`SKIP phone font comparison: requires a portrait 360vp window; actual=${widthVp}vp`);
          expect(true).assertTrue();
        }
      } catch (e) {
        console.error('should_keep_font_visual_size_on_phone error: ' + JSON.stringify(e));
        expect(false).assertTrue();
      } finally {
        done();
      }
    })
  })
}
