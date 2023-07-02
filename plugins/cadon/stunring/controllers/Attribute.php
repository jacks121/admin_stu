<?php namespace Cadon\Stunring\Controllers;

use Backend;
use BackendMenu;
use Backend\Classes\Controller;
use Cadon\Stunring\Models\Attribute as ModelAttribute;
use Input;
use Flash;

class Attribute extends Controller
{
    public $implement = [
        \Backend\Behaviors\FormController::class,
        \Backend\Behaviors\ListController::class
    ];

    public $formConfig = 'config_form.yaml';
    public $listConfig = 'config_list.yaml';

    public function __construct()
    {
        parent::__construct();
        BackendMenu::setContext('Cadon.Stunring', 'main-menu-item', 'side-menu-item4');
    }
}
