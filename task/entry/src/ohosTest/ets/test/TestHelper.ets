import { Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { expect } from '@ohos/hypium';

export const SETTINGS_CARD_ID: string = 'issue-card-01';
export const LOGOUT_LABEL: string = '退出登录';
export const LAST_MENU_LABEL: string = '检查更新';

// Independent oracle: the accepted straight-phone design is 720 lpx / 360 vp.
// Do not calculate this from the current window width or the production helper.
interface FontSample {
  text: string;
  fontSizeVp: number;
}

const FONT_SAMPLES: FontSample[] = [
  { text: '账号与安全', fontSizeVp: 13.5 },
  { text: '通用设置', fontSizeVp: 13.5 },
  { text: '免打扰 22:00-次日08:00', fontSizeVp: 11.5 }
];

export async function startAbility(driver: Driver, bundleName: string): Promise<void> {
  const want: Want = { bundleName: bundleName, abilityName: 'EntryAbility' };
  await abilityDelegatorRegistry.getAbilityDelegator().startAbility(want);
  await driver.waitForIdle(2000, 3000);
}

export async function openSettingsPage(driver: Driver): Promise<void> {
  // Re-enter the page to reset scrolling between suites and individual checks.
  if (await driver.findComponent(ON.text('设置')) !== null) {
    await driver.pressBack();
    await driver.waitForIdle(1000, 2000);
  }
  const settingsCard = await driver.findComponent(ON.id(SETTINGS_CARD_ID));
  expect(settingsCard !== null).assertTrue();
  if (settingsCard !== null) {
    await settingsCard.click();
    await driver.waitForIdle(2000, 3000);
  }
}

export async function findRequiredText(driver: Driver, text: string): Promise<Component> {
  const component = await driver.findComponent(ON.text(text));
  expect(component !== null).assertTrue();
  return component;
}

// This helper checks only whether the logout button exists and is reachable.
// It intentionally does not inspect the button's position relative to the menu.
export async function findLogoutButton(driver: Driver, bundleName: string): Promise<Component> {
  let component = await driver.findComponent(ON.text(LOGOUT_LABEL));
  if (component !== null) {
    return component;
  }

  const window = await driver.findWindow({ bundleName: bundleName, active: true });
  const windowBounds = await window.getBounds();
  const centerX = Math.round((windowBounds.left + windowBounds.right) / 2);
  const startY = Math.round(windowBounds.bottom - 80);
  const endY = Math.round(windowBounds.top + 80);

  for (let index = 0; index < 5; index++) {
    await driver.swipe(centerX, startY, centerX, endY, 800);
    await driver.waitForIdle(1000, 2000);
    component = await driver.findComponent(ON.text(LOGOUT_LABEL));
    if (component !== null) {
      return component;
    }
  }

  expect(false).assertTrue();
  return component;
}

export async function verifyMenuAndLogoutDoNotOverlap(driver: Driver, bundleName: string): Promise<void> {
  await findLogoutButton(driver, bundleName);
  const logout = await driver.findComponent(ON.id('settings-logout-button'));
  const lastMenuItem = await driver.findComponent(ON.id('settings-menu-item-10'));
  const logoutBounds = await logout.getBounds();
  const lastMenuItemBounds = await lastMenuItem.getBounds();

  expect(logoutBounds.top >= lastMenuItemBounds.bottom).assertTrue();
}

export async function verifyFontsMatchPhoneReference(driver: Driver): Promise<void> {
  const ability = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
  const appWindow = await window.getLastWindow(ability.context);
  const uiContext = appWindow.getUIContext();
  const measure = uiContext.getMeasureUtils();

  for (const sample of FONT_SAMPLES) {
    const text = await findRequiredText(driver, sample.text);
    const bounds = await text.getBounds();
    // These Text nodes have intrinsic width (no width/layoutWeight/padding).
    // Compare px with px; explicit vp also avoids the number/default-fp ambiguity.
    const expected = measure.measureTextSize({
      textContent: sample.text,
      fontSize: `${sample.fontSizeVp}vp`,
      fontWeight: 400
    });
    const expectedWidth = Number(expected.width);
    const actualWidth = bounds.right - bounds.left;
    const tolerance = Math.max(2, expectedWidth * 0.02);
    console.info(`font reference ${sample.text}: actual=${actualWidth}px, ` +
      `expected=${expectedWidth}px, tolerance=${tolerance}px`);
    expect(expectedWidth > 0).assertTrue();
    expect(actualWidth > 0).assertTrue();
    expect(Math.abs(actualWidth - expectedWidth) <= tolerance).assertTrue();
  }
}
