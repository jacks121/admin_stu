<?php namespace Cadon\Stunring\Models;

use Model;

/**
 * Model
 */
class Currency extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'cadon_stunring_currencies';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

}
