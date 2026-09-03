import failToPassTest from './failtopass.test';
import passToPassTest from './passtopass.test';

export default function testsuite() {
  passToPassTest();
  failToPassTest();
}
