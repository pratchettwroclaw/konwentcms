<?php
class I18nSupport
{
    public function getDefinitions()
    {
        include_once("pl.php");
        return Language::get();
    }
}
?>
