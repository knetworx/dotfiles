" Unreal Engine macro syntax highlighting
" Place in ~/.vim/after/syntax/cpp.vim
" Updated: 2025 — UE5 additions

" ============================================================
" Core reflection macros
" ============================================================
syn keyword unrealMacro
    \ UCLASS USTRUCT UENUM UINTERFACE UDELEGATE
    \ UPROPERTY UFUNCTION UMETA UPARAM

" ============================================================
" Boilerplate / generated macros
" ============================================================
syn keyword unrealGenerated
    \ GENERATED_BODY GENERATED_UCLASS_BODY GENERATED_USTRUCT_BODY
    \ GENERATED_UINTERFACE_BODY GENERATED_IINTERFACE_BODY

" ============================================================
" Top-level specifiers (UPROPERTY, UFUNCTION, UCLASS, USTRUCT)
" ============================================================
syn keyword unrealSpecifier
    \ EditAnywhere EditDefaultsOnly EditInstanceOnly EditFixedSize
    \ VisibleAnywhere VisibleDefaultsOnly VisibleInstanceOnly
    \ BlueprintReadWrite BlueprintReadOnly BlueprintGetter BlueprintSetter
    \ BlueprintAssignable BlueprintCallable BlueprintPure
    \ BlueprintImplementableEvent BlueprintNativeEvent
    \ BlueprintAuthorityOnly BlueprintCosmetic
    \ DisplayName ToolTip
    \ Replicated ReplicatedUsing NotReplicated
    \ Transient SaveGame Config GlobalConfig
    \ Instanced Export NoClear
    \ AdvancedDisplay AssetRegistrySearchable Interp
    \ SimpleDisplay AllowPrivateAccess SkipSerialization
    \ TextExportTransient NonTransactional
    \ Server Client NetMulticast Reliable Unreliable WithValidation
    \ Exec CallInEditor SealedEvent ServiceRequest ServiceResponse CustomThunk
    \ Blueprintable NotBlueprintable BlueprintType NotBlueprintType
    \ Abstract Within MinimalAPI Const NoExport
    \ HideDropdown HideCategories ShowCategories AutoExpandCategories AutoCollapseCategories
    \ ClassGroup CollapseCategories DontCollapseCategories
    \ ConversionRoot CustomConstructor DefaultToInstanced
    \ Deprecated NotPlaceable Placeable
    \ ScriptName DevelopmentOnly
    \ FieldNotify

" ============================================================
" Meta key specifiers (inside meta=(...))
" ============================================================
syn keyword unrealMetaKey
    \ WorldContext DefaultToSelf HidePin ExpandEnumAsExecs
    \ DisplayName ShortToolTip OverrideNativeName
    \ EditCondition EditConditionHides InlineEditConditionToggle NoResetToDefault
    \ ClampMin ClampMax UIMin UIMax ArrayClamp NoSpinbox
    \ AllowedClasses AllowedTypes AllowAbstract MustImplement MetaClass UseComponentPicker
    \ ShowDisplayNames ShowOnlyInnerProperties
    \ AlwaysAsPin NeverAsPin PinShownByDefault PinHiddenByDefault CustomizeProperty
    \ BindWidget BindWidgetOptional BindWidgetAnim
    \ AssetBundles IncludeAssetBundles Untracked
    \ Categories Bitmask BitmaskEnum UseEnumValuesAsMaskValuesInEditor
    \ FilePathFilter RelativeToGameDir
    \ RowType DataTablePin
    \ CompactNodeTitle ReturnDisplayName
    \ DeterminesOutputType DynamicOutputParam AutoCreateRefTerm
    \ ArrayParm ArrayTypeDependentParams InternalUseParam
    \ BlueprintThreadSafe NotBlueprintThreadSafe BlueprintInternalUseOnly
    \ BlueprintAutocast BlueprintSpawnableComponent
    \ CommutativeAssociativeBinaryOperator CallableWithoutWorldContext
    \ ChildCanTick ChildCannotTick
    \ IgnoreCategoryKeywordsInSubclasses ComponentWrapperClass PrioritizeCategories
    \ DisableSplitPin HasNativeMake HasNativeBreak
    \ DeprecationMessage Experimental
    \ AllowPrivateAccess Tunable
    \ NativeConst NativeRef

" ============================================================
" Delegate declaration macros
" ============================================================
syn match unrealDelegate
    \ "\<DECLARE_\(DYNAMIC_\)\?\(MULTICAST_\)\?\(SPARSE_\)\?DELEGATE\(_\w\+\)\?"

" ============================================================
" Deprecated macro
" ============================================================
syn keyword unrealDeprecated
    \ UE_DEPRECATED PRAGMA_DISABLE_DEPRECATION_WARNINGS PRAGMA_ENABLE_DEPRECATION_WARNINGS

" ============================================================
" Assert / ensure / verify
" ============================================================
syn keyword unrealAssert
    \ check checkf checkCode checkNoEntry checkNoReentry checkNoRecursion
    \ checkAlways checkfAlways
    \ ensure ensureMsgf ensureAlways
    \ verify verifyf
    \ checkSlow checkfSlow verifySlow

" ============================================================
" Logging
" ============================================================
syn keyword unrealLog
    \ UE_LOG UE_LOGFMT UE_CLOG

" ============================================================
" For some reason, these get their own special colouring in VS
" ============================================================
syn keyword unrealSpecialType
    \ Category Bitmask

" ============================================================
" Highlights
" ============================================================
hi def link unrealMacro       Macro
hi def link unrealGenerated   Special
hi def link unrealSpecifier   Type
hi def link unrealMetaKey     Type
hi def link unrealDelegate    Macro
hi def link unrealDeprecated  WarningMsg
hi def link unrealAssert      Debug
hi def link unrealLog         Function
hi def link unrealSpecialType Label
