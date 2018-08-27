" Vim completion script
" Language:        Haskell
" Original Author: Daniel Campoverde <alx@sillybytes.net>
" URL:             https://github.com/alx741/haskellcomplete.vim
" Last Change:     2018 Aug 26

" Language extensions from:
"   https://hackage.haskell.org/package/Cabal-2.2.0.1/docs/Language-Haskell-Extension.html
"
" GHC options from:
"   https://downloads.haskell.org/~ghc/7.0.4/docs/html/users_guide/flag-reference.html
"   https://downloads.haskell.org/~ghc/8.4.3/docs/html/users_guide/flags.html



" Available completions
let b:completingLangExtension = 0
let b:completingOptionsGHC    = 0

function! haskellcomplete#Complete(findstart, base)
    if a:findstart
        let l:line = getline('.')
        let l:start = col('.') - 1

        if l:line =~ '^\s*{-#\s*LANGUAGE.*'
            while l:start >= 0 && l:line[l:start - 1] !~ '[, ]'
                let l:start -= 1
            endwhile
            let b:completingLangExtension = 1
            return l:start

        elseif l:line =~ '^\s*{-#\s*OPTIONS_GHC.*'
            while l:start >= 0 && l:line[l:start - 1] !~ '[, ]'
                let l:start -= 1
            endwhile
            let b:completingOptionsGHC = 1
            return l:start

        endif

        return start
    endif

    if b:completingLangExtension
        if a:base ==? ""
            " Return all posible Lang extensions
            return s:langExtensions
        else
            let l:matches = []
            for extension in s:langExtensions
                if extension =~? '^' . a:base
                    call add(l:matches, extension)
                endif
            endfor
            return l:matches
        endif


    elseif b:completingOptionsGHC
        if a:base ==? ""
            " Return all posible GHC options
            return s:optionsGHC
        else
            let l:matches = []
            for flag in s:optionsGHC
                if flag =~? '^' . a:base
                    call add(l:matches, flag)
                endif
            endfor
            return l:matches
        endif

    endif

    return -1
endfunction

let s:langExtensions =
    \ [ "OverlappingInstances"
    \ , "UndecidableInstances"
    \ , "IncoherentInstances"
    \ , "DoRec"
    \ , "RecursiveDo"
    \ , "ParallelListComp"
    \ , "MultiParamTypeClasses"
    \ , "MonomorphismRestriction"
    \ , "FunctionalDependencies"
    \ , "Rank2Types"
    \ , "RankNTypes"
    \ , "PolymorphicComponents"
    \ , "ExistentialQuantification"
    \ , "ScopedTypeVariables"
    \ , "PatternSignatures"
    \ , "ImplicitParams"
    \ , "FlexibleContexts"
    \ , "FlexibleInstances"
    \ , "EmptyDataDecls"
    \ , "CPP"
    \ , "KindSignatures"
    \ , "BangPatterns"
    \ , "TypeSynonymInstances"
    \ , "TemplateHaskell"
    \ , "ForeignFunctionInterface"
    \ , "Arrows"
    \ , "Generics"
    \ , "ImplicitPrelude"
    \ , "NamedFieldPuns"
    \ , "PatternGuards"
    \ , "GeneralizedNewtypeDeriving"
    \ , "ExtensibleRecords"
    \ , "RestrictedTypeSynonyms"
    \ , "HereDocuments"
    \ , "MagicHash"
    \ , "TypeFamilies"
    \ , "StandaloneDeriving"
    \ , "UnicodeSyntax"
    \ , "UnliftedFFITypes"
    \ , "InterruptibleFFI"
    \ , "CApiFFI"
    \ , "LiberalTypeSynonyms"
    \ , "TypeOperators"
    \ , "RecordWildCards"
    \ , "RecordPuns"
    \ , "DisambiguateRecordFields"
    \ , "TraditionalRecordSyntax"
    \ , "OverloadedStrings"
    \ , "GADTs"
    \ , "GADTSyntax"
    \ , "MonoPatBinds"
    \ , "RelaxedPolyRec"
    \ , "ExtendedDefaultRules"
    \ , "UnboxedTuples"
    \ , "DeriveDataTypeable"
    \ , "DeriveGeneric"
    \ , "DefaultSignatures"
    \ , "InstanceSigs"
    \ , "ConstrainedClassMethods"
    \ , "PackageImports"
    \ , "ImpredicativeTypes"
    \ , "NewQualifiedOperators"
    \ , "PostfixOperators"
    \ , "QuasiQuotes"
    \ , "TransformListComp"
    \ , "MonadComprehensions"
    \ , "ViewPatterns"
    \ , "XmlSyntax"
    \ , "RegularPatterns"
    \ , "TupleSections"
    \ , "GHCForeignImportPrim"
    \ , "NPlusKPatterns"
    \ , "DoAndIfThenElse"
    \ , "MultiWayIf"
    \ , "LambdaCase"
    \ , "RebindableSyntax"
    \ , "ExplicitForAll"
    \ , "DatatypeContexts"
    \ , "MonoLocalBinds"
    \ , "DeriveFunctor"
    \ , "DeriveTraversable"
    \ , "DeriveFoldable"
    \ , "NondecreasingIndentation"
    \ , "SafeImports"
    \ , "Safe"
    \ , "Trustworthy"
    \ , "Unsafe"
    \ , "ConstraintKinds"
    \ , "PolyKinds"
    \ , "DataKinds"
    \ , "ParallelArrays"
    \ , "RoleAnnotations"
    \ , "OverloadedLists"
    \ , "EmptyCase"
    \ , "AutoDeriveTypeable"
    \ , "NegativeLiterals"
    \ , "BinaryLiterals"
    \ , "NumDecimals"
    \ , "NullaryTypeClasses"
    \ , "ExplicitNamespaces"
    \ , "AllowAmbiguousTypes"
    \ , "JavaScriptFFI"
    \ , "PatternSynonyms"
    \ , "PartialTypeSignatures"
    \ , "NamedWildCards"
    \ , "DeriveAnyClass"
    \ , "DeriveLift"
    \ , "StaticPointers"
    \ , "StrictData"
    \ , "Strict"
    \ , "ApplicativeDo"
    \ , "DuplicateRecordFields"
    \ , "TypeApplications"
    \ , "TypeInType"
    \ , "UndecidableSuperClasses"
    \ , "MonadFailDesugaring"
    \ , "TemplateHaskellQuotes"
    \ , "OverloadedLabels"
    \ , "TypeFamilyDependencies"
    \ , "DerivingStrategies"
    \ , "UnboxedSums"
    \ , "HexFloatLiterals"
    \ ]

let s:optionsGHC =
    \ [ "-n"
    \ , "-v"
    \ , "-vn"
    \ , "-c"
    \ , "-hcsuf"
    \ , "-hidir"
    \ , "-hisuf"
    \ , "-o"
    \ , "-odir"
    \ , "-ohi"
    \ , "-osuf"
    \ , "-stubdir"
    \ , "-outputdir"
    \ , "-keep-hc-file"
    \ , "-keep-llvm-file"
    \ , "-keep-s-file"
    \ , "-keep-raw-s-file"
    \ , "-keep-tmp-files"
    \ , "-tmpdir"
    \ , "-ddump-hi"
    \ , "-ddump-hi-diffs"
    \ , "-ddump-minimal-imports"
    \ , "-fforce-recomp"
    \ , "-fno-force-recomp"
    \ , "-fbreak-on-exception"
    \ , "-fno-break-on-exception"
    \ , "-fbreak-on-error"
    \ , "-fno-break-on-error"
    \ , "-fprint-evld-with-show"
    \ , "-fno-print-evld-with-show"
    \ , "-fprint-bind-result"
    \ , "-fno-print-bind-result"
    \ , "-fno-print-bind-contents"
    \ , "-fno-implicit-import-qualified"
    \ , "-package-name"
    \ , "-no-auto-link-packages"
    \ , "-fglasgow-exts"
    \ , "-fno-glasgow-exts"
    \ , "-XOverlappingInstances"
    \ , "-XNoOverlappingInstances"
    \ , "-XIncoherentInstances"
    \ , "-XNoIncoherentInstances"
    \ , "-XUndecidableInstances"
    \ , "-XNoUndecidableInstances"
    \ , "-fcontext-stack=Nn"
    \ , "-XArrows"
    \ , "-XNoArrows"
    \ , "-XDisambiguateRecordFields"
    \ , "-XNoDisambiguateRecordFields"
    \ , "-XForeignFunctionInterface"
    \ , "-XNoForeignFunctionInterface"
    \ , "-XGenerics"
    \ , "-XNoGenerics"
    \ , "-XImplicitParams"
    \ , "-XNoImplicitParams"
    \ , "-firrefutable-tuples"
    \ , "-fno-irrefutable-tuples"
    \ , "-XNoImplicitPrelude"
    \ , "-XImplicitPrelude"
    \ , "-XRebindableSyntax"
    \ , "-XNoRebindableSyntax"
    \ , "-XNoMonomorphismRestriction"
    \ , "-XMonomorphismRrestriction"
    \ , "-XNoNPlusKPatterns"
    \ , "-XNPlusKPatterns"
    \ , "-XNoMonoPatBinds"
    \ , "-XMonoPatBinds"
    \ , "-XRelaxedPolyRec"
    \ , "-XNoRelaxedPolyRec"
    \ , "-XExtendedDefaultRules"
    \ , "-XNoExtendedDefaultRules"
    \ , "-XOverloadedStrings"
    \ , "-XNoOverloadedStrings"
    \ , "-XGADTs"
    \ , "-XNoGADTs"
    \ , "-XTypeFamilies"
    \ , "-XNoTypeFamilies"
    \ , "-XScopedTypeVariables"
    \ , "-XNoScopedTypeVariables"
    \ , "-XMonoLocalBinds"
    \ , "-XNoMonoLocalBinds"
    \ , "-XTemplateHaskell"
    \ , "-XNoTemplateHaskell"
    \ , "-XQuasiQuotes"
    \ , "-XNoQuasiQuotes"
    \ , "-XBangPatterns"
    \ , "-XNoBangPatterns"
    \ , "-XCPP"
    \ , "-XNoCPP"
    \ , "-XPatternGuards"
    \ , "-XNoPatternGuards"
    \ , "-XViewPatterns"
    \ , "-XNoViewPatterns"
    \ , "-XUnicodeSyntax"
    \ , "-XNoUnicodeSyntax"
    \ , "-XMagicHash"
    \ , "-XNoMagicHash"
    \ , "-XNewQualifiedOperators"
    \ , "-XNoNewQualifiedOperators"
    \ , "-XExplicitForALl"
    \ , "-XNoExplicitForAll"
    \ , "-XPolymorphicComponents"
    \ , "-XNoPolymorphicComponents"
    \ , "-XRank2Types"
    \ , "-XNoRank2Types"
    \ , "-XRankNTypes"
    \ , "-XNoRankNTypes"
    \ , "-XImpredicativeTypes"
    \ , "-XNoImpredicativeTypes"
    \ , "-XExistentialQuantification"
    \ , "-XNoExistentialQuantification"
    \ , "-XKindSignatures"
    \ , "-XNoKindSignatures"
    \ , "-XEmptyDataDecls"
    \ , "-XNoEmptyDataDecls"
    \ , "-XParallelListComp"
    \ , "-XNoParallelListComp"
    \ , "-XTransformListComp"
    \ , "-XNoTransformListComp"
    \ , "-XUnliftedFFITypes"
    \ , "-XNoUnliftedFFITypes"
    \ , "-XLiberalTypeSynonyms"
    \ , "-XNoLiberalTypeSynonyms"
    \ , "-XTypeOperators"
    \ , "-XNoTypeOperators"
    \ , "-XDoRec"
    \ , "-XNoDoRec"
    \ , "-XRecursiveDo"
    \ , "-XNoRecursiveDo"
    \ , "-XPArr"
    \ , "-XNoPArr"
    \ , "-XRecordWildCards"
    \ , "-XNoRecordWildCards"
    \ , "-XNamedFieldPuns"
    \ , "-XNoNamedFieldPuns"
    \ , "-XDisambiguateRecordFields"
    \ , "-XNoDisambiguateRecordFields"
    \ , "-XUnboxedTuples"
    \ , "-XNoUnboxedTuples"
    \ , "-XStandaloneDeriving"
    \ , "-XNoStandaloneDeriving"
    \ , "-XDeriveDataTypeable"
    \ , "-XNoDeriveDataTypeable"
    \ , "-XGeneralizedNewtypeDeriving"
    \ , "-XNoGeneralizedNewtypeDeriving"
    \ , "-XTypeSynonymInstances"
    \ , "-XNoTypeSynonymInstances"
    \ , "-XFlexibleContexts"
    \ , "-XNoFlexibleContexts"
    \ , "-XFlexibleInstances"
    \ , "-XNoFlexibleInstances"
    \ , "-XConstrainedClassMethods"
    \ , "-XNoConstrainedClassMethods"
    \ , "-XMultiParamTypeClasses"
    \ , "-XNoMultiParamTypeClasses"
    \ , "-XFunctionalDependencies"
    \ , "-XNoFunctionalDependencies"
    \ , "-XPackageImports"
    \ , "-XNoPackageImports"
    \ , "-W"
    \ , "-w"
    \ , "-w"
    \ , "-Wall"
    \ , "-w"
    \ , "-Werror"
    \ , "-Wwarn"
    \ , "-Wwarn"
    \ , "-Werror"
    \ , "-fwarn-unrecognised-pragmas"
    \ , "-fno-warn-unrecognised-pragmas"
    \ , "-fwarn-warnings-deprecations"
    \ , "-fno-warn-warnings-deprecations"
    \ , "-fwarn-deprecated-flags"
    \ , "-fno-warn-deprecated-flags"
    \ , "-fwarn-duplicate-exports"
    \ , "-fno-warn-duplicate-exports"
    \ , "-fwarn-hi-shadowing"
    \ , "-fno-warn-hi-shadowing"
    \ , "-fwarn-implicit-prelude"
    \ , "-fno-warn-implicit-prelude"
    \ , "-fwarn-incomplete-patterns"
    \ , "-fno-warn-incomplete-patterns"
    \ , "-fwarn-incomplete-record-updates"
    \ , "-fno-warn-incomplete-record-updates"
    \ , "-fwarn-lazy-unlifted-bindings"
    \ , "-fno-warn-lazy-unlifted-bindings"
    \ , "-fwarn-missing-fields"
    \ , "-fno-warn-missing-fields"
    \ , "-fwarn-missing-import-lists"
    \ , "-fnowarn-missing-import-lists"
    \ , "-fwarn-missing-methods"
    \ , "-fno-warn-missing-methods"
    \ , "-fwarn-missing-signatures"
    \ , "-fno-warn-missing-signatures"
    \ , "-fwarn-name-shadowing"
    \ , "-fno-warn-name-shadowing"
    \ , "-fwarn-orphans"
    \ , "-fno-warn-orphans"
    \ , "-fwarn-overlapping-patterns"
    \ , "-fno-warn-overlapping-patterns"
    \ , "-fwarn-tabs"
    \ , "-fno-warn-tabs"
    \ , "-fwarn-type-defaults"
    \ , "-fno-warn-type-defaults"
    \ , "-fwarn-monomorphism-restriction"
    \ , "-fno-warn-monomorphism-restriction"
    \ , "-fwarn-unused-binds"
    \ , "-fno-warn-unused-binds"
    \ , "-fwarn-unused-imports"
    \ , "-fno-warn-unused-imports"
    \ , "-fwarn-unused-matches"
    \ , "-fno-warn-unused-matches"
    \ , "-fwarn-unused-do-bind"
    \ , "-fno-warn-unused-do-bind"
    \ , "-fwarn-wrong-do-bind"
    \ , "-fno-warn-wrong-do-bind"
    \ , "-O"
    \ , "-O0"
    \ , "-On"
    \ , "-O0"
    \ , "-fcase-merge"
    \ , "-fno-case-merge"
    \ , "-fmethod-sharing"
    \ , "-fno-method-sharing"
    \ , "-fdo-eta-reduction"
    \ , "-fno-do-eta-reduction"
    \ , "-fdo-lambda-eta-expansion"
    \ , "-fno-do-lambda-eta-expansion"
    \ , "-fexcess-precision"
    \ , "-fno-excess-precision"
    \ , "-fignore-asserts"
    \ , "-fno-ignore-asserts"
    \ , "-fignore-interface-pragmas"
    \ , "-fno-ignore-interface-pragmas"
    \ , "-fomit-interface-pragmas"
    \ , "-fno-omit-interface-pragmas"
    \ , "-fsimplifier-phases"
    \ , "-fmax-simplifier-iterations"
    \ , "-fcse"
    \ , "-fno-cse"
    \ , "-fspecialise"
    \ , "-fno-specialise"
    \ , "-ffull-laziness"
    \ , "-fno-full-laziness"
    \ , "-ffloat-in"
    \ , "-fno-float-in"
    \ , "-fenable-rewrite-rules"
    \ , "-fno-enable-rewrite-rules"
    \ , "-fstrictness"
    \ , "-fno-strictness"
    \ , "-fstrictness=before=n"
    \ , "-fspec-constr"
    \ , "-fno-spec-constr"
    \ , "-fliberate-case"
    \ , "-fno-liberate-case"
    \ , "-fstatic-argument-transformation"
    \ , "-fno-static-argument-transformation"
    \ , "-funbox-strict-fields"
    \ , "-fno-unbox-strict-fields"
    \ , "-feager-blackholing"
    \ , "-auto"
    \ , "-no-auto"
    \ , "-auto-all"
    \ , "-no-auto-all"
    \ , "-caf-all"
    \ , "-no-caf-all"
    \ , "-hpcdir"
    \ , "-F"
    \ , "-cpp"
    \ , "-Dsymbol[=value]"
    \ , "-Usymbol"
    \ , "-Usymbol"
    \ , "-Idir"
    \ , "-fasm"
    \ , "-fvia-C"
    \ , "-fvia-C"
    \ , "-fasm"
    \ , "-fllvm"
    \ , "-fasm"
    \ , "-fno-code"
    \ , "-fbyte-code"
    \ , "-fobject-code"
    \ , "-shared"
    \ , "-dynamic"
    \ , "-framework"
    \ , "-framework-path"
    \ , "-llib"
    \ , "-Ldir"
    \ , "-main-is"
    \ , "--mk-dll"
    \ , "-no-hs-main"
    \ , "-rtsopts,"
    \ , "-with-rtsopts=opts"
    \ , "-no-link"
    \ , "-split-objs"
    \ , "-fno-gen-manifest"
    \ , "-fno-embed-manifest"
    \ , "-fno-shared-implib"
    \ , "-dylib-install-name"
    \ , "-pgmL"
    \ , "-pgmP"
    \ , "-pgmc"
    \ , "-pgmm"
    \ , "-pgms"
    \ , "-pgma"
    \ , "-pgml"
    \ , "-pgmdll"
    \ , "-pgmF"
    \ , "-pgmwindres"
    \ , "-optL"
    \ , "-optP"
    \ , "-optF"
    \ , "-optc"
    \ , "-optlo"
    \ , "-optlc"
    \ , "-optm"
    \ , "-opta"
    \ , "-optl"
    \ , "-optdll"
    \ , "-optwindres"
    \ , "-msse2"
    \ , "-monly-[432]-regs"
    \ , "-fext-core"
    \ , "-dcore-lint"
    \ , "-ddump-asm"
    \ , "-ddump-bcos"
    \ , "-ddump-cmm"
    \ , "-ddump-cpranal"
    \ , "-ddump-cse"
    \ , "-ddump-deriv"
    \ , "-ddump-ds"
    \ , "-ddump-flatC"
    \ , "-ddump-foreign"
    \ , "-ddump-hpc"
    \ , "-ddump-inlinings"
    \ , "-ddump-llvm"
    \ , "-ddump-occur-anal"
    \ , "-ddump-opt-cmm"
    \ , "-ddump-parsed"
    \ , "-ddump-prep"
    \ , "-ddump-rn"
    \ , "-ddump-rules"
    \ , "-ddump-simpl"
    \ , "-ddump-simpl-phases"
    \ , "-ddump-simpl-iterations"
    \ , "-ddump-spec"
    \ , "-ddump-splices"
    \ , "-ddump-stg"
    \ , "-ddump-stranal"
    \ , "-ddump-tc"
    \ , "-ddump-types"
    \ , "-ddump-worker-wrapper"
    \ , "-ddump-if-trace"
    \ , "-ddump-tc-trace"
    \ , "-ddump-rn-trace"
    \ , "-ddump-rn-stats"
    \ , "-ddump-simpl-stats"
    \ , "-dsource-stats"
    \ , "-dcmm-lint"
    \ , "-dstg-lint"
    \ , "-dstg-stats"
    \ , "-dverbose-core2core"
    \ , "-dverbose-stg2stg"
    \ , "-dshow-passes"
    \ , "-dfaststring-stats"
    \ , "-fno-asm-mangling"
    \ , "-fno-ghci-sandbox"
    \ , "-fdiagnostics-color="
    \ , "-fdiagnostics-show-caret"
    \ , "-fno-diagnostics-show-caret"
    \ , "-ferror-spans"
    \ , "-fhide-source-paths"
    \ , "-fprint-equality-relations"
    \ , "-fno-print-equality-relations"
    \ , "-fprint-expanded-synonyms"
    \ , "-fno-print-expanded-synonyms"
    \ , "-fprint-explicit-coercions"
    \ , "-fno-print-explicit-coercions"
    \ , "-fprint-explicit-foralls"
    \ , "-fno-print-explicit-foralls"
    \ , "-fprint-explicit-kinds"
    \ , "-fno-print-explicit-kinds"
    \ , "-fprint-explicit-runtime-rep"
    \ , "-fno-print-explicit-runtime-reps"
    \ , "-fprint-explicit-runtime-reps"
    \ , "-fno-print-explicit-runtime-reps"
    \ , "-fprint-potential-instances"
    \ , "-fno-print-potential-instances"
    \ , "-fprint-typechecker-elaboration"
    \ , "-fno-print-typechecker-elaboration"
    \ , "-fprint-unicode-syntax"
    \ , "-fno-print-unicode-syntax"
    \ , "-fshow-hole-constraints"
    \ , "-Rghc-timing"
    \ , "-v"
    \ , "-v"
    \ , "-F"
    \ , "-x"
    \ , "--exclude-module="
    \ , "-ddump-mod-cycles"
    \ , "-dep-makefile"
    \ , "-dep-suffix"
    \ , "-dumpdir"
    \ , "-hcsuf"
    \ , "-hidir"
    \ , "-hisuf"
    \ , "-include-pkg-deps"
    \ , "-o"
    \ , "-odir"
    \ , "-ohi"
    \ , "-osuf"
    \ , "-outputdir"
    \ , "-stubdir"
    \ , "-keep-hc-file,"
    \ , "-keep-hi-files"
    \ , "-no-keep-hi-files"
    \ , "-keep-llvm-file,"
    \ , "-keep-o-files"
    \ , "-no-keep-o-files"
    \ , "-keep-s-file,"
    \ , "-keep-tmp-files"
    \ , "-tmpdir"
    \ , "-i"
    \ , "-i[:]*"
    \ , "-ddump-hi"
    \ , "-ddump-hi-diffs"
    \ , "-ddump-minimal-imports"
    \ , "-fforce-recomp"
    \ , "-fno-force-recomp"
    \ , "-fignore-hpc-changes"
    \ , "-fno-ignore-hpc-changes"
    \ , "-fignore-optim-changes"
    \ , "-fno-ignore-optim-changes"
    \ , "-fbreak-on-error"
    \ , "-fno-break-on-error"
    \ , "-fbreak-on-exception"
    \ , "-fno-break-on-exception"
    \ , "-fghci-hist-size="
    \ , "-flocal-ghci-history"
    \ , "-fno-local-ghci-history"
    \ , "-fprint-bind-result"
    \ , "-fno-print-bind-result"
    \ , "-fshow-loaded-modules"
    \ , "-ghci-script"
    \ , "-ignore-dot-ghci"
    \ , "-interactive-print"
    \ , "-clear-package-db"
    \ , "-distrust"
    \ , "-distrust-all-packages"
    \ , "-fpackage-trust"
    \ , "-global-package-db"
    \ , "-hide-all-packages"
    \ , "-hide-package"
    \ , "-ignore-package"
    \ , "-no-auto-link-packages"
    \ , "-no-global-package-db"
    \ , "-no-user-package-db"
    \ , "-package"
    \ , "-package-db"
    \ , "-package-env"
    \ , "-package-id"
    \ , "-this-unit-id"
    \ , "-trust"
    \ , "-user-package-db"
    \ , "-fdefer-out-of-scope-variables"
    \ , "-fno-defer-out-of-scope-variables"
    \ , "-fdefer-type-errors"
    \ , "-fno-defer-type-errors"
    \ , "-fdefer-typed-holes"
    \ , "-fno-defer-typed-holes"
    \ , "-fhelpful-errors"
    \ , "-fno-helpful-errors"
    \ , "-fmax-pmcheck-iterations="
    \ , "-fshow-warning-groups"
    \ , "-fno-show-warning-groups"
    \ , "-W"
    \ , "-w"
    \ , "-w"
    \ , "-Wall"
    \ , "-w"
    \ , "-Wall-missed-specialisations"
    \ , "-Wno-all-missed-specialisations"
    \ , "-Wamp"
    \ , "-Wno-amp"
    \ , "-Wcompat"
    \ , "-Wno-compat"
    \ , "-Wcpp-undef"
    \ , "-Wdeferred-out-of-scope-variables"
    \ , "-Wno-deferred-out-of-scope-variables"
    \ , "-Wdeferred-type-errors"
    \ , "-Wno-deferred-type-errors"
    \ , "-Wdeprecated-flags"
    \ , "-Wno-deprecated-flags"
    \ , "-Wdeprecations"
    \ , "-Wno-deprecations"
    \ , "-Wdodgy-exports"
    \ , "-Wno-dodgy-exports"
    \ , "-Wdodgy-foreign-imports"
    \ , "-Wno-dodgy-foreign-import"
    \ , "-Wdodgy-imports"
    \ , "-Wno-dodgy-imports"
    \ , "-Wduplicate-constraints"
    \ , "-Wno-duplicate-constraints"
    \ , "-Wduplicate-exports"
    \ , "-Wno-duplicate-exports"
    \ , "-Wempty-enumerations"
    \ , "-Wno-empty-enumerations"
    \ , "-Werror"
    \ , "-Wwarn"
    \ , "-Weverything"
    \ , "-Whi-shadowing"
    \ , "-Wno-hi-shadowing"
    \ , "-Widentities"
    \ , "-Wno-identities"
    \ , "-Wimplicit-prelude"
    \ , "-Wno-implicit-prelude"
    \ , "-Wincomplete-patterns"
    \ , "-Wno-incomplete-patterns"
    \ , "-Wincomplete-record-updates"
    \ , "-Wno-incomplete-record-updates"
    \ , "-Wincomplete-uni-patterns"
    \ , "-Wno-incomplete-uni-patterns"
    \ , "-Winline-rule-shadowing"
    \ , "-Wno-inline-rule-shadowing"
    \ , "-Wmissed-specialisations"
    \ , "-Wno-missed-specialisations"
    \ , "-Wmissing-export-lists"
    \ , "-fnowarn-missing-export-lists"
    \ , "-Wmissing-exported-signatures"
    \ , "-Wno-missing-exported-signatures"
    \ , "-Wmissing-exported-sigs"
    \ , "-Wno-missing-exported-sigs"
    \ , "-Wmissing-fields"
    \ , "-Wno-missing-fields"
    \ , "-Wmissing-home-modules"
    \ , "-Wno-missing-home-modules"
    \ , "-Wmissing-import-lists"
    \ , "-fnowarn-missing-import-lists"
    \ , "-Wmissing-local-signatures"
    \ , "-Wno-missing-local-signatures"
    \ , "-Wmissing-local-sigs"
    \ , "-Wno-missing-local-sigs"
    \ , "-Wmissing-methods"
    \ , "-Wno-missing-methods"
    \ , "-Wmissing-monadfail-instances"
    \ , "-Wno-missing-monadfail-instances"
    \ , "-Wmissing-pattern-synonym-signatures"
    \ , "-Wno-missing-pattern-synonym-signatures"
    \ , "-Wmissing-signatures"
    \ , "-Wno-missing-signatures"
    \ , "-Wmonomorphism-restriction"
    \ , "-Wno-monomorphism-restriction"
    \ , "-Wname-shadowing"
    \ , "-Wno-name-shadowing"
    \ , "-Wno-compat"
    \ , "-Wcompat"
    \ , "-Wnoncanonical-monad-instances"
    \ , "-Wno-noncanonical-monad-instances"
    \ , "-Wnoncanonical-monadfail-instances"
    \ , "-Wno-noncanonical-monadfail-instances"
    \ , "-Wnoncanonical-monoid-instances"
    \ , "-Wno-noncanonical-monoid-instances"
    \ , "-Worphans"
    \ , "-Wno-orphans"
    \ , "-Woverflowed-literals"
    \ , "-Wno-overflowed-literals"
    \ , "-Woverlapping-patterns"
    \ , "-Wno-overlapping-patterns"
    \ , "-Wpartial-fields"
    \ , "-Wno-partial-fields"
    \ , "-Wpartial-type-signatures"
    \ , "-Wno-partial-type-signatures"
    \ , "-Wredundant-constraints"
    \ , "-Wno-redundant-constraints"
    \ , "-Wsafe"
    \ , "-Wno-safe"
    \ , "-Wsemigroup"
    \ , "-Wno-semigroup"
    \ , "-Wsimplifiable-class-constraints"
    \ , "-Wno-overlapping-patterns"
    \ , "-Wtabs"
    \ , "-Wno-tabs"
    \ , "-Wtrustworthy-safe"
    \ , "-Wno-safe"
    \ , "-Wtype-defaults"
    \ , "-Wno-type-defaults"
    \ , "-Wtyped-holes"
    \ , "-Wno-typed-holes"
    \ , "-Wunbanged-strict-patterns"
    \ , "-Wno-unbanged-strict-patterns"
    \ , "-Wunrecognised-pragmas"
    \ , "-Wno-unrecognised-pragmas"
    \ , "-Wunrecognised-warning-flags"
    \ , "-Wno-unrecognised-warning-flags"
    \ , "-Wunsafe"
    \ , "-Wno-unsafe"
    \ , "-Wunsupported-calling-conventions"
    \ , "-Wno-unsupported-calling-conventions"
    \ , "-Wunsupported-llvm-version"
    \ , "-Wno-monomorphism-restriction"
    \ , "-Wunticked-promoted-constructors"
    \ , "-Wno-unticked-promoted-constructors"
    \ , "-Wunused-binds"
    \ , "-Wno-unused-binds"
    \ , "-Wunused-do-bind"
    \ , "-Wno-unused-do-bind"
    \ , "-Wunused-foralls"
    \ , "-Wno-unused-foralls"
    \ , "-Wunused-imports"
    \ , "-Wno-unused-imports"
    \ , "-Wunused-local-binds"
    \ , "-Wno-unused-local-binds"
    \ , "-Wunused-matches"
    \ , "-Wno-unused-matches"
    \ , "-Wunused-pattern-binds"
    \ , "-Wno-unused-pattern-binds"
    \ , "-Wunused-top-binds"
    \ , "-Wno-unused-top-binds"
    \ , "-Wunused-type-patterns"
    \ , "-Wno-unused-type-patterns"
    \ , "-Wwarn"
    \ , "-Werror"
    \ , "-Wwarnings-deprecations"
    \ , "-Wno-warnings-deprecations"
    \ , "-Wwrong-do-bind"
    \ , "-Wno-wrong-do-bind"
    \ , "-O,"
    \ , "-O0"
    \ , "-O0"
    \ , "-O2"
    \ , "-O0"
    \ , "-Odph"
    \ , "-fcall-arity"
    \ , "-fno-call-arity"
    \ , "-fcase-folding"
    \ , "-fno-case-folding"
    \ , "-fcase-merge"
    \ , "-fno-case-merge"
    \ , "-fcmm-elim-common-blocks"
    \ , "-fno-cmm-elim-common-blocks"
    \ , "-fcmm-sink"
    \ , "-fno-cmm-sink"
    \ , "-fcpr-anal"
    \ , "-fno-cpr-anal"
    \ , "-fcross-module-specialise"
    \ , "-fno-cross-module-specialise"
    \ , "-fcse"
    \ , "-fno-cse"
    \ , "-fdicts-cheap"
    \ , "-fno-dicts-cheap"
    \ , "-fdicts-strict"
    \ , "-fno-dicts-strict"
    \ , "-fdmd-tx-dict-sel"
    \ , "-fno-dmd-tx-dict-sel"
    \ , "-fdo-eta-reduction"
    \ , "-fno-do-eta-reduction"
    \ , "-fdo-lambda-eta-expansion"
    \ , "-fno-do-lambda-eta-expansion"
    \ , "-feager-blackholing"
    \ , "-fenable-rewrite-rules"
    \ , "-fno-enable-rewrite-rules"
    \ , "-fexcess-precision"
    \ , "-fno-excess-precision"
    \ , "-fexitification"
    \ , "-fno-exitification"
    \ , "-fexpose-all-unfoldings"
    \ , "-fno-expose-all-unfoldings"
    \ , "-ffloat-in"
    \ , "-fno-float-in"
    \ , "-ffull-laziness"
    \ , "-fno-full-laziness"
    \ , "-ffun-to-thunk"
    \ , "-fno-fun-to-thunk"
    \ , "-fignore-asserts"
    \ , "-fno-ignore-asserts"
    \ , "-fignore-interface-pragmas"
    \ , "-fno-ignore-interface-pragmas"
    \ , "-flate-dmd-anal"
    \ , "-fno-late-dmd-anal"
    \ , "-fliberate-case"
    \ , "-fno-liberate-case"
    \ , "-fliberate-case-threshold="
    \ , "-fno-liberate-case-threshold"
    \ , "-fllvm-pass-vectors-in-regs"
    \ , "-fno-llvm-pass-vectors-in-regs"
    \ , "-floopification"
    \ , "-fno-loopification"
    \ , "-fmax-inline-alloc-size="
    \ , "-fmax-inline-memcpy-insns="
    \ , "-fmax-inline-memset-insns="
    \ , "-fmax-relevant-binds="
    \ , "-fno-max-relevant-bindings"
    \ , "-fmax-simplifier-iterations="
    \ , "-fmax-uncovered-patterns="
    \ , "-fmax-valid-substitutions="
    \ , "-fno-max-valid-substitutions"
    \ , "-fmax-worker-args="
    \ , "-fno-opt-coercion"
    \ , "-fno-pre-inlining"
    \ , "-fno-state-hack"
    \ , "-fomit-interface-pragmas"
    \ , "-fno-omit-interface-pragmas"
    \ , "-fomit-yields"
    \ , "-fno-omit-yields"
    \ , "-foptimal-applicative-do"
    \ , "-fno-optimal-applicative-do"
    \ , "-fpedantic-bottoms"
    \ , "-fno-pedantic-bottoms"
    \ , "-fregs-graph"
    \ , "-fno-regs-graph"
    \ , "-fregs-iterative"
    \ , "-fno-regs-iterative"
    \ , "-fsimpl-tick-factor="
    \ , "-fsimplifier-phases="
    \ , "-fsolve-constant-dicts"
    \ , "-fno-solve-constant-dicts"
    \ , "-fspec-constr"
    \ , "-fno-spec-constr"
    \ , "-fspec-constr-count="
    \ , "-fno-spec-constr-count"
    \ , "-fspec-constr-keen"
    \ , "-fno-spec-constr-keen"
    \ , "-fspec-constr-threshold="
    \ , "-fno-spec-constr-threshold"
    \ , "-fspecialise"
    \ , "-fno-specialise"
    \ , "-fspecialise-aggressively"
    \ , "-fno-specialise-aggressively"
    \ , "-fstatic-argument-transformation"
    \ , "-fno-static-argument-transformation"
    \ , "-fstg-cse"
    \ , "-fno-stg-cse"
    \ , "-fstrictness"
    \ , "-fno-strictness"
    \ , "-fstrictness-before="
    \ , "-funbox-small-strict-fields"
    \ , "-fno-unbox-small-strict-fields"
    \ , "-funbox-strict-fields"
    \ , "-fno-unbox-strict-fields"
    \ , "-funfolding-creation-threshold="
    \ , "-funfolding-dict-discount="
    \ , "-funfolding-fun-discount="
    \ , "-funfolding-keeness-factor="
    \ , "-funfolding-use-threshold="
    \ , "-fvectorisation-avoidance"
    \ , "-fno-vectorisation-avoidance"
    \ , "-fvectorise"
    \ , "-fno-vectorise"
    \ , "-fno-prof-auto"
    \ , "-fprof-auto"
    \ , "-fno-prof-cafs"
    \ , "-fprof-cafs"
    \ , "-fno-prof-count-entries"
    \ , "-fprof-count-entries"
    \ , "-fprof-auto"
    \ , "-fno-prof-auto"
    \ , "-fprof-auto-calls"
    \ , "-fno-prof-auto-calls"
    \ , "-fprof-auto-exported"
    \ , "-fno-prof-auto"
    \ , "-fprof-auto-top"
    \ , "-fno-prof-auto"
    \ , "-fprof-cafs"
    \ , "-fno-prof-cafs"
    \ , "-prof"
    \ , "-ticky"
    \ , "-fhpc"
    \ , "-cpp"
    \ , "-D[=]"
    \ , "-U"
    \ , "-I"
    \ , "-U"
    \ , "-dynamic"
    \ , "-too"
    \ , "-fasm"
    \ , "-fllvm"
    \ , "-fbyte-code"
    \ , "-fllvm"
    \ , "-fasm"
    \ , "-fno-code"
    \ , "-fobject-code"
    \ , "-fPIC"
    \ , "-fPIE"
    \ , "-fwrite-interface"
    \ , "-debug"
    \ , "-dylib-install-name"
    \ , "-dynamic"
    \ , "-dynload"
    \ , "-eventlog"
    \ , "-fno-embed-manifest"
    \ , "-fno-gen-manifest"
    \ , "-fno-shared-implib"
    \ , "-framework"
    \ , "-framework-path"
    \ , "-fwhole-archive-hs-libs"
    \ , "-L"
    \ , "-l"
    \ , "-main-is"
    \ , "-no-hs-main"
    \ , "-no-rtsopts-suggestions"
    \ , "-package"
    \ , "-pie"
    \ , "-rdynamic"
    \ , "-rtsopts[=]"
    \ , "-shared"
    \ , "-split-objs"
    \ , "-split-sections"
    \ , "-static"
    \ , "-staticlib"
    \ , "-threaded"
    \ , "-with-rtsopts="
    \ , "-fplugin-opt=:"
    \ , "-fplugin="
    \ , "-hide-all-plugin-packages"
    \ , "-plugin-package"
    \ , "-plugin-package-id"
    \ , "-pgma"
    \ , "-pgmc"
    \ , "-pgmdll"
    \ , "-pgmF"
    \ , "-pgmi"
    \ , "-pgmL"
    \ , "-pgml"
    \ , "-pgmlc"
    \ , "-pgmlibtool"
    \ , "-pgmlo"
    \ , "-pgmP"
    \ , "-pgms"
    \ , "-pgmwindres"
    \ , "-opta"
    \ , "-optc"
    \ , "-optdll"
    \ , "-optF"
    \ , "-opti"
    \ , "-optL"
    \ , "-optl"
    \ , "-optlc"
    \ , "-optlo"
    \ , "-optP"
    \ , "-optwindres"
    \ , "-msse2"
    \ , "-msse4.2"
    \ , "-dcmm-lint"
    \ , "-dcore-lint"
    \ , "-ddump-asm"
    \ , "-ddump-asm-expanded"
    \ , "-ddump-asm-liveness"
    \ , "-ddump-asm-native"
    \ , "-ddump-asm-regalloc"
    \ , "-ddump-asm-regalloc-stages"
    \ , "-ddump-asm-stats"
    \ , "-ddump-bcos"
    \ , "-ddump-cmm"
    \ , "-ddump-cmm-caf"
    \ , "-ddump-cmm-cbe"
    \ , "-ddump-cmm-cfg"
    \ , "-ddump-cmm-cps"
    \ , "-ddump-cmm-from-stg"
    \ , "-ddump-cmm-info"
    \ , "-ddump-cmm-proc"
    \ , "-ddump-cmm-procmap"
    \ , "-ddump-cmm-raw"
    \ , "-ddump-cmm-sink"
    \ , "-ddump-cmm-sp"
    \ , "-ddump-cmm-split"
    \ , "-ddump-cmm-switch"
    \ , "-ddump-cmm-verbose"
    \ , "-ddump-core-stats"
    \ , "-ddump-cse"
    \ , "-ddump-deriv"
    \ , "-ddump-ds"
    \ , "-ddump-ec-trace"
    \ , "-ddump-foreign"
    \ , "-ddump-if-trace"
    \ , "-ddump-inlinings"
    \ , "-ddump-json"
    \ , "-ddump-llvm"
    \ , "-ddump-occur-anal"
    \ , "-ddump-opt-cmm"
    \ , "-ddump-parsed"
    \ , "-ddump-parsed-ast"
    \ , "-ddump-prep"
    \ , "-ddump-rn"
    \ , "-ddump-rn-ast"
    \ , "-ddump-rn-stats"
    \ , "-ddump-rn-trace"
    \ , "-ddump-rule-firings"
    \ , "-ddump-rule-rewrites"
    \ , "-ddump-rules"
    \ , "-ddump-simpl"
    \ , "-ddump-simpl-iterations"
    \ , "-ddump-simpl-stats"
    \ , "-ddump-spec"
    \ , "-ddump-splices"
    \ , "-ddump-stg"
    \ , "-ddump-str-signatures"
    \ , "-ddump-stranal"
    \ , "-ddump-tc"
    \ , "-ddump-tc-ast"
    \ , "-ddump-tc-trace"
    \ , "-ddump-timings"
    \ , "-ddump-to-file"
    \ , "-ddump-types"
    \ , "-ddump-vect"
    \ , "-ddump-vt-trace"
    \ , "-ddump-worker-wrapper"
    \ , "-dfaststring-stats"
    \ , "-dinitial-unique="
    \ , "-dno-debug-output"
    \ , "-ddebug-output"
    \ , "-dppr-case-as-let"
    \ , "-dppr-cols="
    \ , "-dppr-debug"
    \ , "-dppr-user-length"
    \ , "-dshow-passes"
    \ , "-dstg-lint"
    \ , "-dsuppress-all"
    \ , "-dsuppress-coercions"
    \ , "-dsuppress-idinfo"
    \ , "-dsuppress-module-prefixes"
    \ , "-dsuppress-stg-free-vars"
    \ , "-dsuppress-ticks"
    \ , "-dsuppress-type-applications"
    \ , "-dsuppress-type-signatures"
    \ , "-dsuppress-unfoldings"
    \ , "-dsuppress-uniques"
    \ , "-dsuppress-var-kinds"
    \ , "-dth-dec-file="
    \ , "-dunique-increment="
    \ , "-dverbose-core2core"
    \ , "-dverbose-stg2stg"
    \ , "-falignment-sanitisation"
    \ , "-fcatch-bottoms"
    \ , "-fllvm-fill-undef-with-garbage"
    \ , "-g,"
    \ , "-fexternal-interpreter"
    \ , "-fglasgow-exts"
    \ , "-fno-glasgow-exts"
    \ , "-ghcversion-file"
    \ , "-H"
    \ , "-j[]"
    \ ]
