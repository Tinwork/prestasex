{if isset($confirmation)}
    <div class="alert alert-success">
        La configuration a bien été mis à jour
    </div>
{/if}

<form method="post" action="" class="defaultForm form-horizontal">
    <div class="panel">
        <div class="panel-heading">
            <i class="icon-cogs"></i>
            Configuration du module
        </div>
        <div class="form-wrapper">
            <div class="form-group">
                <label class="control-label col-lg-3">Nombres de miniatures :</label>
                <div class="col-lg-9">
                    <input type="text" class="form-control" name="miniatures" value="{if isset($config['items'])}{$config['items']}{/if}">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Couleur de fond :</label>
                <div class="col-lg-9">
                    <input type="text" class="form-control" name="color" id="color" value="{if isset($config['color'])}{$config['color']}{/if}">
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <button class="btn btn-default pull-right" name="submit_prestasex_form_config" value="1" type="submit">
                <i class="process-icon-save"></i>
                Enregistrer
            </button>
        </div>
    </div>
</form>
<script>
    $("#color").spectrum({
        clickoutFiresChange: true,
        showButtons: false,
        preferredFormat: "hex",
        showInput: true,
        change: function(color) {
            color.toHexString();
        }
    });
</script>