" Vim completion script
" Language:        Haskell
" Original Author: Daniel Campoverde <alx@sillybytes.net>
" URL:             https://github.com/alx741/haskellcomplete.vim
" Last Change:     2018 Aug 26

let b:completingLangExtension = 0

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
        endif

        return start
    endif

    if b:completingLangExtension
        if a:base ==? ""
            " Return all posible Lang extensions
            echomsg "ALL extensions"
            return s:langExtensions
        else
            echomsg "dont know yet"
        endif
    endif
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
