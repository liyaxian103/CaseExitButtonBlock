import { afterAll, beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver } from '@kit.TestKit';
import {
  openSettingsPage,
  startAbility,
  verifyFontsMatchPhoneReference,
  verifyMenuAndLogoutDoNotOverlap
} from './TestHelper';

export default function failToPassTest() {
  describe('FailToPassTest', () => {
    let driver: Driver;
    let bundleName: string;

    beforeAll(async () => {
      try {
        driver = Driver.create();
        bundleName = abilityDelegatorRegistry.getArguments().bundleName;
        await startAbility(driver, bundleName);
        await openSettingsPage(driver);
      } catch (e) {
        console.error('FailToPassTest beforeAll error: ' + JSON.stringify(e));
      }
    })

    afterAll(async () => {
      try {
        await driver.waitForIdle(2000, 3000);
      } catch (e) {
        console.error('FailToPassTest afterAll error: ' + JSON.stringify(e));
      }
    })

    it('should_show_logout_under_menu', Level.LEVEL1, async (done: Function) => {
      try {
        await openSettingsPage(driver);
        const window = await driver.findWindow({ bundleName: bundleName, active: true });
        const bounds = await window.getBounds();
        console.info(`verify settings layout at ${bounds.right - bounds.left}x${bounds.bottom - bounds.top}px`);
        await verifyMenuAndLogoutDoNotOverlap(driver, bundleName);
      } catch (e) {
        console.error('should_show_logout_under_menu error: ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    })

    it('should_keep_font_visual_size', Level.LEVEL1, async (done: Function) => {
      try {
        await openSettingsPage(driver);
        const window = await driver.findWindow({ bundleName: bundleName, active: true });
        const bounds = await window.getBounds();
        console.info(`verify phone-reference fonts at ${bounds.right - bounds.left}x` +
          `${bounds.bottom - bounds.top}px`);
        await verifyFontsMatchPhoneReference(driver);
      } catch (e) {
        console.error('should_keep_font_visual_size error: ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    })
  })
}
