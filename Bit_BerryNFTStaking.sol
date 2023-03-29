/**
 *Submitted for verification at BscScan.com on 2023-03-29
*/

/**
 *Submitted for verification at BscScan.com on 2023-03-28
 */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

// File: @openzeppelin/contracts/token/ERC721/IERC721.sol
pragma solidity ^0.8.0;

/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721 is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(
        address indexed owner,
        address indexed approved,
        uint256 indexed tokenId
    );

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId)
        external
        view
        returns (address operator);

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator)
        external
        view
        returns (bool);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
}

interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);

    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function totalSupply() external view returns (uint256);

    function balanceOf(address who) external view returns (uint256);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

library SafeMath {
    /**

    * @dev Multiplies two unsigned integers, reverts on overflow.

    */

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the

        // benefit is lost if 'b' is also tested.

        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522

        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;

        require(c / a == b);

        return c;
    }

    /**

    * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.

    */

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0

        require(b > 0);

        uint256 c = a / b;

        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**

    * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).

    */

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);

        uint256 c = a - b;

        return c;
    }

    /**

    * @dev Adds two unsigned integers, reverts on overflow.

    */

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;

        require(c >= a);

        return c;
    }

    /**

    * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),

    * reverts when dividing by zero.

    */

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);

        return a % b;
    }
}

contract Ownable {
    address private _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**

     * @dev Initializes the contract setting the deployer as the initial owner.

     */

    constructor() {
        _owner = msg.sender;

        emit OwnershipTransferred(address(0), _owner);
    }

    /**

     * @dev Returns the address of the current owner.

     */

    function owner() public view returns (address) {
        return _owner;
    }

    /**

     * @dev Throws if called by any account other than the owner.

     */

    modifier onlyOwner() {
        require(_owner == msg.sender, "Ownable: caller is not the owner");

        _;
    }

    /**

     * @dev Transfers ownership of the contract to a new account (`newOwner`).

     * Can only be called by the current owner.

     */

    function transferOwnership(address newOwner) public onlyOwner {
        require(
            newOwner != address(0),
            "Ownable: new owner is the zero address"
        );

        emit OwnershipTransferred(_owner, newOwner);

        _owner = newOwner;
    }
}

contract Bit_Berry_NFT_Staking is Ownable {
    using SafeMath for uint256;
    IERC20 public busd;
    IERC721 public NFT;
    address public deadAddress = 0x000000000000000000000000000000000000dEaD;

    struct Stake {
        uint256 _NFTs;
        uint256 _days;
        uint256 _stakeTime;
        uint256 _stakeTimeUpdated;
    }

    uint256 public RefferalReward = 3000000000000000000;
    uint256 public time = 1 days;
    uint256 public minimumNFT = 25;
    uint256 public maximumNFT = 1000;

    mapping(address => Stake[]) public stakesOf;
    mapping(uint256 => uint256) public allocation;
    mapping(address => uint256) public commulativeWithdrawReward;
    mapping(uint256 => bool) public isNFTStaked;
    mapping(address => bool) public refferalStatus;

    event Deposite(
        address indexed to,
        address indexed From,
        uint256 day,
        uint256 time
    );

    constructor(IERC20 _tokenaddr, IERC721 _nftaddr) {
        busd = _tokenaddr;
        NFT = _nftaddr;
        _paused = false;
        allocation[30] = 1000000000000000000; //1% daily profit
        allocation[90] = 1000000000000000000; //1% daily profit
        allocation[180] = 1000000000000000000; //1% daily profit
    }

    function checkOwner(uint256 _tokenID) public view returns (bool success) {
        require(
            NFT.ownerOf(_tokenID) == msg.sender,
            "You don't own this nft id!"
        );

        return success = true;
    }

    function farm(
        uint256 _lockableDays,
        uint256 _tokenID,
        address refferal
    ) public whenNotPaused {
        address caller = msg.sender; // to save gas fee

        require(checkOwner(_tokenID) == true, "you are not owner of this id");
        require(allocation[_lockableDays] > 0, "Invalid day selection");
        NFT.transferFrom(caller, address(this), _tokenID);

        if (refferal != deadAddress) {
            require(
                refferalStatus[refferal] == true,
                "please enter correct refferal"
            );
            busd.transfer(refferal, RefferalReward);
        }
        refferalStatus[caller] = true;

        stakesOf[caller].push(
            Stake({
                _NFTs: _tokenID,
                _days: _lockableDays,
                _stakeTime: block.timestamp,
                _stakeTimeUpdated: block.timestamp
            })
        );

        emit Deposite(caller, address(this), _lockableDays, block.timestamp);
    }

    function harvest(uint256 _index) public whenNotPaused {
        uint256 currentTime = block.timestamp; // to save gas fee.
        address caller = msg.sender; // to save gas fee.

        Stake[] memory _userAllStakes = stakesOf[caller];
        Stake storage _userData = stakesOf[caller][_index];

        require(_index <= _userAllStakes.length, "Invalid index number");
        if (currentTime >= (_userData._days * time + _userData._stakeTime)) {}

        // calculate reward
        uint256 reward = calculateReward(caller, _index);

        uint256 totalWithdraw = reward;
        busd.transfer(caller, totalWithdraw);
        commulativeWithdrawReward[caller] += totalWithdraw;
    }

    function calculateReward(address _owner, uint256 _index)
        public
        view
        returns (uint256 reward)
    {
        Stake memory _userData = stakesOf[_owner][_index];
        uint256 currentTime = block.timestamp; // to save gas fee.

        if (currentTime <= (_userData._days * time + _userData._stakeTime)) {
            uint256 times = _userData._stakeTimeUpdated.sub(currentTime);
            uint256 rewardPerSecond = ((1 days) * 1e18) / (1000000000000000000); //1% reward
            uint256 totalReward = (times * rewardPerSecond) / 1e18;
            _userData._stakeTimeUpdated = block.timestamp;
            return totalReward;
        } else {
            uint256 totalReward = _userData._days.mul(1000000000000000000);
            totalReward = totalReward - commulativeWithdrawReward[msg.sender];
            return totalReward;
        }
    }

    // function to mark stake false for the given NFT IDs.
    // Note: This function can only be called within harvest function.
    function unstakeData(uint256[] memory _tokenIDs) internal {
        for (uint256 i; i < _tokenIDs.length; i++) {
            isNFTStaked[_tokenIDs[i]] = false;
        }
    }

    // return all the staked information of given user in the form of array.
    function UserInformation(address _addr)
        public
        view
        returns (Stake[] memory _userData)
    {
        return stakesOf[_addr];
    }

    function changeRefferalReward(uint256 _amount) public {
        RefferalReward = _amount;
    }

    function emergencyWithdraw(uint256 _token) external onlyOwner {
        busd.transfer(msg.sender, _token);
    }

    function emergencyWithdrawBNB(uint256 Amount) external onlyOwner {
        payable(msg.sender).transfer(Amount);
    }

    // function to change the time according to the seconds of one day.
    function changetime(uint256 _time) external onlyOwner {
        time = _time;
    }

    function setMinMaxNFT(uint256 _min, uint256 _max) external onlyOwner {
        maximumNFT = _max;
        minimumNFT = _min;
    }

    event Paused(address account);

    /**
     * @dev Emitted when the pause is lifted by `account`.
     */
    event Unpaused(address account);

    bool private _paused;

    /**
     * @dev Initializes the contract in unpaused state.
     */

    /**
     * @dev Returns true if the contract is paused, and false otherwise.
     */
    function paused() public view virtual returns (bool) {
        return _paused;
    }

    /**
     * @dev Modifier to make a function callable only when the contract is not paused.
     *
     * Requirements:
     *
     * - The contract must not be paused.
     */
    modifier whenNotPaused() {
        require(!paused(), "Pausable: paused");
        _;
    }

    /**
     * @dev Modifier to make a function callable only when the contract is paused.
     *
     * Requirements:
     *
     * - The contract must be paused.
     */
    modifier whenPaused() {
        require(paused(), "Pausable: not paused");
        _;
    }

    /**
     * @dev Triggers stopped state.
     *
     * Requirements:
     *
     * - The contract must not be paused.
     */
    function _pause() internal virtual whenNotPaused {
        _paused = true;
        emit Paused(msg.sender);
    }

    /**
     * @dev Returns to normal state.
     *
     * Requirements:
     *
     * - The contract must be paused.
     */
    function _unpause() internal virtual whenPaused {
        _paused = false;
        emit Unpaused(msg.sender);
    }

    function Pause() external onlyOwner {
        _paused = true;
    }

    function UnPause() external onlyOwner {
        _paused = false;
    }

    function changeToken(IERC20 addr) public onlyOwner {
        busd = addr;
    }

    function changeNFT(IERC721 addr) public onlyOwner {
        NFT = addr;
    }
}
