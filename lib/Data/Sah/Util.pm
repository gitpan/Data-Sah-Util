package Data::Sah::Util;

use 5.010;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw();

our $VERSION = '0.01'; # VERSION

# currently we cheat by only parsing a limited subset of schema. this is because
# Data::Sah is not available yet.
sub _parse_schema {
    my ($schema) = @_;

    $schema = [$schema, {}] if !ref($schema);
    die "BUG: Can't parse hash-form schema yet" if ref($schema) ne 'ARRAY';

    my $type = $schema->[0];
    $type =~ s/\*$// and $schema->[1]{required} = 1;
    die "BUG: Can't handle type `$type` yet"
        unless $type =~ /^(int|float|bool|str|array|hash|any|code|obj)$/;

    {type=>$type, clause_sets=>[$schema->[1]]};
}

1;
#ABSTRACT: Schema utility routines (Temporary module)

__END__
=pod

=head1 NAME

Data::Sah::Util - Schema utility routines (Temporary module)

=head1 VERSION

version 0.01

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

