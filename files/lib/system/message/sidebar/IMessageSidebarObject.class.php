<?php
namespace wcf\system\message\sidebar;

/**
 * Any sidebar object should implement this interface.
 * 
 * @author	Marcel Werk
 * @copyright	2001-2011 WoltLab GmbH
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package	com.woltlab.wcf.message.sidebar
 * @subpackage	system.message.sidebar
 * @category 	Community Framework
 */
interface IMessageSidebarObject {
	/**
	 * Returns the user object of this message.
	 *
	 * @return 	wcf\data\user\UserProfile
	 */
	public function getUserProfile();
	
	/**
	 * Returns the message id.
	 *
	 * @return 	integer
	 */
	public function getMessageID();
	
	/**
	 * Returns the message type.
	 *
	 * @return 	string
	 */
	public function getMessageType();
}
