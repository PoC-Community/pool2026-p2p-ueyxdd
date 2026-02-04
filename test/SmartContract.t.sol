import "forge-std/Test.sol";
import "../src/SmartContract.sol";

contract SmartContractHelper is SmartContract {
    function getAreYouABadPerson() public view returns (bool) {
        return _areYouABadPerson;
    }

    function callSetAreYouABadPerson(bool value) public {
        _setAreYouABadPerson(value);
    }
}

contract SmartContractTest is Test {
    SmartContractHelper helper;

    function setUp() public {
        helper = new SmartContractHelper();
    }

    function testGetHalfAnswerOfLife() public {
        assertEq(helper.getHalfAnswerOfLife(), 21);
    }

    function testInternalVariableAccess() public {
        assertEq(helper.getAreYouABadPerson(), false);
        helper.callSetAreYouABadPerson(true);
        assertEq(helper.getAreYouABadPerson(), true);
    }

    function testStructData() public {
        (
            string memory firstName,
            string memory lastName,
            uint8 age,
            string memory city,
            SmartContract.roleEnum role
        ) = helper.myinformations();

        assertEq(firstName, "test");
        assertEq(lastName, "test");
        assertEq(age, 19);
        assertEq(city, "Paris");
        assertEq(uint(role), uint(SmartContract.roleEnum.STUDENT));
    }
}