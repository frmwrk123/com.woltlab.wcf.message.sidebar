<?php
namespace wcf\system\message\sidebar;
use wcf\page\IPage;
use wcf\system\event\EventHandler;

// TODO: move to options.xml
if (!defined('MESSAGE_SIDEBAR_ENABLE_ONLINE_STATUS')) define('MESSAGE_SIDEBAR_ENABLE_ONLINE_STATUS', 0);
if (!defined('MODULE_USER_RANK')) define('MODULE_USER_RANK', 0);
if (!defined('MESSAGE_SIDEBAR_ENABLE_AVATAR')) define('MESSAGE_SIDEBAR_ENABLE_AVATAR', 1);

/**
 * Manages the message sidebars.
 * 
 * @author	Marcel Werk
 * @copyright	2001-2011 WoltLab GmbH
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package	com.woltlab.wcf.message.sidebar
 * @subpackage	system.message.sidebar
 * @category 	Community Framework
 */
class MessageSidebarFactory {
	/**
	 * sidebar container.
	 * @var	wcf\page\IPage
	 */
	public $container = null;
	
	/**
	 * list of sidebar objects.
	 *
	 * @var array<wcf\system\message\sidebar\MessageSidebar>
	 */
	public $messageSidebars = array();
	
	/**
	 * Creates a new MessageSidebarFactory.
	 *
	 * @param	wcf\page\IPage		$container
	 */
	public function __construct(IPage $container = null) {
		$this->container = $container;
	}
	
	/**
	 * Creates the sidebar for the given object.
	 *
	 * @param	wcf\system\message\sidebar\IMessageSidebarObject	$object
	 */
	public function create(IMessageSidebarObject $object) {
		if (!isset($this->messageSidebars[$object->getMessageType().'-'.$object->getMessageID()])) {
			$sidebar = new MessageSidebar($object);
			$this->messageSidebars[$object->getMessageType().'-'.$object->getMessageID()] = $sidebar;
		}
	}
	
	/**
	 * Returns the sidebar object for message.
	 *
	 * @param	string		$messageType
	 * @param	integer		$messageID
	 * @return	wcf\system\message\sidebar\MessageSidebar
	 */
	public function get($messageType, $messageID) {
		return $this->messageSidebars[$messageType.'-'.$messageID];
	}
	
	/**
	 * Initializes the sidebars.
	 */
	public function init() {
		// call init event
		EventHandler::getInstance()->fireAction($this, 'init');
	}
}
