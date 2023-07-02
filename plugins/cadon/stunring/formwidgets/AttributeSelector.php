<?php namespace Cadon\Stunring\FormWidgets;

use Backend\Classes\FormWidgetBase;

class AttributeSelector extends FormWidgetBase
{
    public function widgetDetails()
    {
        return [
            'name' => 'Attribute Selector',
            'description' => 'A custom form widget for selecting attributes'
        ];
    }

    public function render()
    {
        $this->prepareVars();
    
        return $this->makePartial('attributeselector');
    }
    
    public function prepareVars()
    {
        $attributes = \Cadon\Stunring\Models\Attribute::with('values')->get();
    
        $this->vars['attributes'] = $attributes;
    }

    public function loadAssets()
    {
        // Load any required JavaScript and CSS files
    }

    public function getSaveValue($value)
    {
        // Process the submitted data and return the value to be saved
    }
}
